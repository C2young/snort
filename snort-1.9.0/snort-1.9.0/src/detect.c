/* $Id: detect.c,v 1.26 2002/08/26 21:10:07 roesch Exp $ */
/*
** Copyright (C) 1998-2002 Martin Roesch <roesch@sourcefire.com>
**
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program; if not, write to the Free Software
** Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/

/*  I N C L U D E S  **********************************************/
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <string.h>
#include <stdlib.h>
#include <assert.h>

#include "snort.h"
#include "detect.h"
#include "plugbase.h"
#include "debug.h"
#include "util.h"
#include "mstring.h"
#include "tag.h"
#include "perf-event.h"
#include "threshold.h"

/* #define MARTY_BENCHMARKS */

/* XXX remove when state tracking moves into the decode stage */
#include "preprocessors/spp_stream4.h"

//#define ITERATIVE_ENGINE

extern ListHead Alert;         /* Alert Block Header */
extern ListHead Log;           /* Log Block Header */
extern ListHead Pass;          /* Pass Block Header */
extern ListHead Activation;    /* Activation Block Header */
extern ListHead Dynamic;       /* Dynamic Block Header */

extern RuleTreeNode *rtn_tmp;      /* temp data holder */
extern OptTreeNode *otn_tmp;       /* OptTreeNode temp ptr */
extern ListHead *head_tmp;         /* ListHead temp ptr */

extern RuleListNode *RuleLists;

extern int dynamic_rules_present;
extern int active_dynamic_nodes;

extern PreprocessFuncNode *PreprocessList;  /* Preprocessor function list */
extern OutputFuncNode *AlertList;   /* Alert function list */
extern OutputFuncNode *LogList; /* log function list */

int do_detect;
u_int32_t event_id;
char check_tags_flag;

void printRuleListOrder(RuleListNode * node);

int Preprocess(Packet * p)
{
    PreprocessFuncNode *idx;
    int retval = 0;
    

    do_detect = 1;
    idx = PreprocessList;

    while(idx != NULL)
    {
        assert(idx->func != NULL);
        idx->func(p);
        idx = idx->next;
    }

    if(do_detect)
    {
        retval = Detect(p);

        /*if(retval && 
           !(p->packet_flags & PKT_REBUILT_STREAM))
        {
            AlertFlushStream(p, p->ssnptr);
        }*/
    }

    if(otn_tmp != NULL)
        otn_tmp = NULL;

    return retval;
}

void ObfuscatePacket(Packet *p)
{
    /* only obfuscate once */
    if(p->packet_flags & PKT_OBFUSCATED)
        return;
    
    /* we only obfuscate IP packets */
    if(!p->iph)
        return;
    
    if(pv.obfuscation_net == 0)
    {
        p->iph->ip_src.s_addr = 0x00000000;
        p->iph->ip_dst.s_addr = 0x00000000;
    }
    else
    {
        if(pv.homenet != 0)
        {
            if((p->iph->ip_src.s_addr & pv.netmask) == pv.homenet)
            {
                p->iph->ip_src.s_addr = pv.obfuscation_net |
                    (p->iph->ip_src.s_addr & pv.obfuscation_mask);
            }
            if((p->iph->ip_dst.s_addr & pv.netmask) == pv.homenet)
            {
                p->iph->ip_dst.s_addr = pv.obfuscation_net |
                    (p->iph->ip_dst.s_addr & pv.obfuscation_mask);
            }
        }
        else
        {
            p->iph->ip_src.s_addr = pv.obfuscation_net |
                (p->iph->ip_src.s_addr & pv.obfuscation_mask);
            p->iph->ip_dst.s_addr = pv.obfuscation_net |
                (p->iph->ip_dst.s_addr & pv.obfuscation_mask);
        }
    }
    p->packet_flags |= PKT_OBFUSCATED;
}


void CallLogFuncs(Packet *p, char *message, ListHead *head, Event *event)
{
    OutputFuncNode *idx = NULL;

    /* set the event number */
    event->event_id = event_id;

    pc.log_pkts++;

    if(head == NULL)
    {
        CallLogPlugins(p, message, NULL, event);
        return;
    }

    if(p != NULL)
    {
        if((p->packet_flags & PKT_LOGGED) != PKT_LOGGED)
        {
            p->packet_flags |= PKT_LOGGED;
        }
        else
        {
            return;
        }
        if(pv.obfuscation_flag)
            ObfuscatePacket(p);
    }


    idx = head->LogList;
    if(idx == NULL)
        idx = LogList;

    while(idx != NULL)
    {
        idx->func(p, message, idx->arg, event);
        idx = idx->next;
    }

    return;
}

void CallLogPlugins(Packet * p, char *message, void *args, Event *event)
{
    OutputFuncNode *idx;

    idx = LogList;

    if(p != NULL)
    {
        if((p->packet_flags & PKT_LOGGED) != PKT_LOGGED)
        {
            p->packet_flags |= PKT_LOGGED;
        }
        else
        {
            return;
        }
        
        if(pv.obfuscation_flag)
            ObfuscatePacket(p);
    }

    pc.log_pkts++;

    while(idx != NULL)
    {
        idx->func(p, message, idx->arg, event);
        idx = idx->next;
    }

    return;
}

void CallAlertFuncs(Packet * p, char *message, ListHead * head, Event *event)
{
    OutputFuncNode *idx = NULL;

#ifdef USE_SF_STATS     
    UpdateEvents();
#endif /* USE_SF_STATS */
    
    /* set the event number */
    event->event_id = ++event_id;

    /* set the event reference info */
    event->event_reference = event->event_id;

    if(p)
    {
        event->ref_time.tv_sec = p->pkth->ts.tv_sec;
        event->ref_time.tv_usec = p->pkth->ts.tv_usec;
    }

    if(head == NULL)
    {
        CallAlertPlugins(p, message, NULL, event);
        return;
    }

    if(p && pv.obfuscation_flag)
        ObfuscatePacket(p);

    pc.alert_pkts++;
    idx = head->AlertList;

    if(idx == NULL)
        idx = AlertList;

    while(idx != NULL)
    {
        idx->func(p, message, idx->arg, event);
        idx = idx->next;
    }

    return;
}


void CallAlertPlugins(Packet * p, char *message, void *args, Event *event)
{
    OutputFuncNode *idx;

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "Call Alert Plugins\n"););
    idx = AlertList;
    
    if(p && pv.obfuscation_flag)
        ObfuscatePacket(p);

    pc.alert_pkts++;
    while(idx != NULL)
    {
        idx->func(p, message, idx->arg, event);
        idx = idx->next;
    }

    return;
}



/****************************************************************************
 *
 * Function: Detect(Packet *)
 *
 * Purpose: Apply the rules lists to the current packet
 *
 * Arguments: p => ptr to the decoded packet struct
 *
 * Returns: 1 == detection event
 *          0 == no detection
 *
 ***************************************************************************/
int Detect(Packet * p)
{
    Event event;

    RuleListNode *rule;

    rule = RuleLists;

    check_tags_flag = 1;

    if(p && p->iph == NULL)
        return 0;

    while(rule != NULL)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "[*] Evaluating rule list: %s\n", 
                    rule->name););

#ifdef MARTY_BENCHMARKS
        printf("[*] Evaluating packet on list \"%s\"...\n", rule->name);
#endif

        if(EvalPacket(rule->RuleList, rule->mode, p))
        {
            /* if a pass rule matches the current rule,
             * we still want to check the tags list
             */
            if(check_tags_flag == 1) 
            {
                if(CheckTagList(p, &event))
                {
                    DEBUG_WRAP(DebugMessage(DEBUG_FLOW, "Matching tag node "
                                "found, calling log functions\n"););

                    /* if we find a match, we want to send the packet to the
                     * logging mechanism
                     */
                    CallLogFuncs(p, NULL, NULL, &event);
                } 
            }

            return rule->rval;
        }

        rule = rule->next;
    }

    DEBUG_WRAP(DebugMessage(DEBUG_FLOW, "Checking tags list (if "
                "check_tags_flag = 1)\n"););

    /* if we didn't match on any rules, check the tag list */
    if(check_tags_flag == 1) 
    {
        DEBUG_WRAP(DebugMessage(DEBUG_FLOW, "calling CheckTagList\n"););

        if(CheckTagList(p, &event))
        {
            DEBUG_WRAP(DebugMessage(DEBUG_FLOW, "Matching tag node found, "
                        "calling log functions\n"););

            /* if we find a match, we want to send the packet to the
             * logging mechanism
             */
            CallLogFuncs(p, NULL, NULL, &event);

            return 1;
        } 
    }

    return 0;
}




/****************************************************************************
 *
 * Function: EvalPacket(ListHead *, int )
 *
 * Purpose: Figure out which rule tree to call based on protocol
 *
 * Arguments: List => the rule list to check
 *            mode => the rule mode (alert, log, etc)
 *
 * Returns: 1 on a match, 0 on a miss
 *
 ***************************************************************************/
int EvalPacket(ListHead * List, int mode, Packet * p)
{
    RuleTreeNode *rtn_idx;
    int retval = 0;
    int check_ports = 0;

    if(p->iph == NULL)
    {
        return 0;
    }

    /* figure out which list to look at */
    if(!retval)
    {
        rtn_idx = NULL;

        switch(p->iph->ip_proto)
        {
            case IPPROTO_TCP:
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT, 
                            "Detecting on TcpList\n"););

                if(p->tcph != NULL)
                    rtn_idx = List->TcpList;

                check_ports = 1;
                
                break;

            case IPPROTO_UDP:
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT, 
                            "Detecting on UdpList\n"););

                if(p->udph != NULL)
                    rtn_idx = List->UdpList;

                check_ports = 1;

                break;

            case IPPROTO_ICMP:
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT, 
                            "Detecting on IcmpList\n"););

                if(p->icmph != NULL)
                    rtn_idx = List->IcmpList;

                break;

            default:
                rtn_idx = NULL;
                break;
        }

#ifdef ITERATIVE_ENGINE
        /* we check the ports to see if we've walked out of the range of 
         * possible detection for the current RTN
         */
        if(check_ports)
        {
#ifdef MARTY_BENCHMARKS
            printf("    Entering RTN loop...\n");
#endif
            while(rtn_idx != NULL)
            {
#ifdef MARTY_BENCHMARKS
                printf("    Processing RTN %d\n", rtn_idx->head_node_number);
#endif

                /* check if the destination port of the packet is less
                 * than the dest port of the current rule header and that
                 * the rule header does not have the EXCEPTION flag set
                 *
                 * if this check comes back affirmative, we pop out of the 
                 * detection early as a performance enhancement
                 */
                if(!(rtn_idx->flags & EXCEPT_DST_PORT) && p->dp < rtn_idx->ldp)
                {
#ifdef MARTY_BENCHMARKS
                    printf("    Exiting RTN loop due to dest "
                           "port walk off...\n");
#endif
                    return 0;
                }

                /* check to see if this rule header (and it's associated
                 * option lists) have matched on this packet indicating
                 * a successful detection
                 */
                if(EvalHeader(rtn_idx, p, 0))
                {
#ifdef MARTY_BENCHMARKS
                    printf("    <!!> Exiting RTN loop due to detection!\n");
#endif
                    return 1;
                }

                /* step to the next RTN */
                rtn_idx = rtn_idx->right;
            }
        }
        else
        {
#ifdef MARTY_BENCHMARKS
            printf("    Entering RTN loop...\n");
#endif
            while(rtn_idx != NULL)
            {
#ifdef MARTY_BENCHMARKS
                printf("    Processing RTN %d\n", rtn_idx->head_node_number);
#endif

                if(EvalHeader(rtn_idx, p, 0))
                {
#ifdef MARTY_BENCHMARKS
                    printf("    <!!> Exiting RTN loop due to detection!\n");
#endif
                    return 1;
                }

                rtn_idx = rtn_idx->right;
            }
        }

        rtn_idx = List->IpList;

        while(rtn_idx != NULL)
        {
            if(EvalHeader(rtn_idx, p, 0))
            {
#ifdef MARTY_BENCHMARKS
                printf("    <!!> Exiting RTN loop due to detection!\n");
#endif
                return 1;
            }

            rtn_idx = rtn_idx->right;
        }
#else  // RECURSIVE ENGINE BELOW
#ifdef MARTY_BENCHMARKS
        printf("    Entering RTN recursion...\n");
#endif
        retval = EvalHeader(rtn_idx, p, check_ports);

        if(!retval)
        {
            rtn_idx = List->IpList;
            retval = EvalHeader(rtn_idx, p, 0);
        }
        else
        {
#ifdef MARTY_BENCHMARKS
            printf("    <!!> Exiting RTN recursion due to detection!\n");
#endif
        }
#endif
    }

    return retval;
}


/****************************************************************************
 *
 * Function: EvalHeader(RuleTreeNode *, Packet * )
 *
 * Purpose: Implement two dimensional recursive linked-list-of-function-pointers
 *          detection engine!  This part looks at the IP header info (and
 *          ports if necessary) and decides whether or not to proceed down
 *          the rule option chain.  Did I mention it's recursive?  For all
 *          you fans of the old goto system, sorry.... :)
 *
 * Arguments: rtn_idx => the rule block node to test
 *            p => ptr to the packet data structure
 *
 * Returns: 1 on a match, 0 on a miss
 *
 ***************************************************************************/
int EvalHeader(RuleTreeNode * rtn_idx, Packet * p, int check_ports)
{
    int rule_match = 0;
    //    OptTreeNode *List;

    if(rtn_idx == NULL)
    {
        return 0;
    }

#ifndef ITERATIVE_ENGINE
    if(check_ports)
    {
        if(!(rtn_idx->flags & EXCEPT_DST_PORT) && p->dp < rtn_idx->ldp)
        {
#ifdef MARTY_BENCHMARKS
            printf("        Exiting RTN recursion due to dest "
                    "port walk off...\n");
#endif

            return 0;
        }
    }
#endif

    if(rtn_idx->type == RULE_DYNAMIC)
    {
        if(!active_dynamic_nodes)
        {
            return 0;
        }

        if(rtn_idx->active_flag == 0)
        {
#ifdef ITERATIVE_ENGINE
#ifdef MARTY_BENCHMARKS
            printf("            Exiting DYNAMIC rule\n");
#endif
            return 0;
#else
            return EvalHeader(rtn_idx->right, p, check_ports);
#endif
        }
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "[*] Rule Head %d\n", 
                rtn_idx->head_node_number);)

        if(!rtn_idx->rule_func->RuleHeadFunc(p, rtn_idx, rtn_idx->rule_func))
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                        "   => Header check failed, checking next node\n"););
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT, 
                        "   => returned from next node check\n"););
#ifdef ITERATIVE_ENGINE
#ifdef MARTY_BENCHMARKS
            printf("            Exiting due to RTN mismatch\n");
#endif
            return 0;
#else
            return EvalHeader(rtn_idx->right, p, check_ports);
#endif
        }
        else
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                        "   => Got head match, checking options chain\n"););

#ifdef ITERATIVE_ENGINE
#ifdef MARTY_BENCHMARKS
            printf("            <!> RTN match, processing OTN loop\n");
#endif
            List = rtn_idx->down;

            while(List != NULL)
            {
                if(EvalOpts(List, p))
                {
#ifdef MARTY_BENCHMARKS
                    printf("            <!!> OTN match, exiting engine\n");
#endif
                    rule_match = 1;
                    goto got_match;
                }

                List = List->next;
            }
#else
            rule_match = EvalOpts(rtn_idx->down, p);
#endif

#ifdef ITERATIVE_ENGINE
got_match:
#endif
            if(rule_match)
            {
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                            "   => Got rule match, rtn_idx type = %d\n",
                            rtn_idx->type););

                if(otn_tmp->threshold != 0)
                {
                   if(Threshold(p, &otn_tmp->event_data, otn_tmp->threshold, 
                            otn_tmp->window, otn_tmp->threshold_type) == 0)
                   {
                       return 1;
                   }
                }

                if(p->packet_flags & PKT_STREAM_UNEST_UNI &&
                        pv.assurance_mode == ASSURE_EST &&
                        (! (p->packet_flags & PKT_REBUILT_STREAM)) &&
                        otn_tmp->stateless == 0)
                {
                    return 1;
                }

                event_id++;

                TriggerResponses(p, otn_tmp);

                switch(rtn_idx->type)
                {
                    case RULE_PASS:
                        PassAction();
                        break;

                    case RULE_ACTIVATE:
                        ActivateAction(p, otn_tmp, &otn_tmp->event_data);
                        break;

                    case RULE_ALERT:
                        AlertAction(p, otn_tmp, &otn_tmp->event_data);
                        break;

                    case RULE_DYNAMIC:
                        DynamicAction(p, otn_tmp, &otn_tmp->event_data);
                        break;

                    case RULE_LOG:
                        LogAction(p, otn_tmp, &otn_tmp->event_data);
                        break;
                }

                SetTags(p, otn_tmp, event_id);

                if(rtn_idx->type != RULE_PASS)
                {
                    check_tags_flag = 0;
                }

                return 1;
            }

            if(!rule_match)
            {
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                            "No match, continuing...\n"););
#ifdef ITERATIVE_ENGINE
#ifdef MARTY_BENCHMARKS
                printf("            Exiting due to OTN non-match\n");
#endif
                return 0;
#else
                return EvalHeader(rtn_idx->right, p, check_ports);
#endif
            }
        }

    return 0;
}

int CheckAddrPort(IpAddrSet *rule_addr, u_int16_t hi_port, u_int16_t lo_port, 
        Packet *p, u_int32_t flags, int mode)
{
    u_long pkt_addr;         /* packet IP address */
    u_short pkt_port;        /* packet port */
    int global_except_addr_flag = 0; /* global exception flag is set */
    int any_port_flag = 0;           /* any port flag set */
    int except_addr_flag = 0;        /* any addr flag set */
    int except_port_flag = 0;        /* port exception flag set */
    int ip_match = 0;                /* flag to indicate addr match made */
    IpAddrSet *idx;  /* ip addr struct indexer */

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "CheckAddrPort: "););
    /* set up the packet particulars */
    if(mode & CHECK_SRC)
    {
        pkt_addr = p->iph->ip_src.s_addr;
        pkt_port = p->sp;

        DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"SRC "););

        if(mode & INVERSE)
        {
            global_except_addr_flag = flags & EXCEPT_DST_IP;
            any_port_flag = flags & ANY_DST_PORT;
            except_port_flag = flags & EXCEPT_DST_PORT;
        }
        else
        {
            global_except_addr_flag = flags & EXCEPT_SRC_IP;
            any_port_flag = flags & ANY_SRC_PORT;
            except_port_flag = flags & EXCEPT_SRC_PORT;
        }
    }
    else
    {
        pkt_addr = p->iph->ip_dst.s_addr;
        pkt_port = p->dp;

        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "DST "););

        if(mode & INVERSE)
        {
            global_except_addr_flag = flags & EXCEPT_SRC_IP;
            any_port_flag = flags & ANY_SRC_PORT;
            except_port_flag = flags & EXCEPT_SRC_PORT;
        }
        else
        {
            global_except_addr_flag = flags & EXCEPT_DST_IP;
            any_port_flag = flags & ANY_DST_PORT;
            except_port_flag = flags & EXCEPT_DST_PORT;
        }
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "addr %lx, port %d", pkt_addr, 
                pkt_port););

    idx = rule_addr;
    if(!(global_except_addr_flag)) /*modeled after Check{Src,Dst}IP function*/
    {
        while(idx != NULL)
        {
            except_addr_flag = idx->addr_flags & EXCEPT_IP;

            /* test the rule address vs. the packet address */
            if(!((idx->ip_addr==(pkt_addr & idx->netmask)) ^ except_addr_flag))
            {
                idx = idx->next;
            }
            else
            {
                ip_match = 1;
                goto bail;
            }
        }
    }
    else
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, ", global exception flag set"););
        /* global exception flag is up, we can't match on *any* 
         * of the source addresses 
         */
        while(idx != NULL)
        {
            except_addr_flag = idx->addr_flags & EXCEPT_IP;

            /* test the rule address vs. the packet address */
            if(((idx->ip_addr == (pkt_addr & idx->netmask)) ^ 
                        except_addr_flag))
            {
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT, 
                            ", address matched, packet rejected\n"));

                /* got address match on globally negated rule, fail */
                return 0;
            }
            idx = idx->next;
        }
        ip_match = 1;
    }

    bail:
    if(!ip_match)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, ", no address match,  "
                    "packet rejected\n"););
        return 0;
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, ", addresses accepted"););
    
    /* if the any port flag is up, we're all done (success) */
    if(any_port_flag)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, ", any port match, "
                    "packet accepted\n"););
        return 1;
    }

    /* check the packet port against the rule port */
    if((pkt_port > hi_port) || (pkt_port < lo_port))
    {
        /* if the exception flag isn't up, fail */
        if(!except_port_flag)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT, ", port mismatch,  "
                        "packet rejected\n"););
            return 0;
        }
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, ", port mismatch exception"););
    }
    else
    {
        /* if the exception flag is up, fail */
        if(except_port_flag)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
				    ", port match exception,  packet rejected\n"););
            return 0;
        }
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, ", ports match"););
    }

    /* ports and address match */
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, ", packet accepted!\n"););
    return 1;

}


/****************************************************************************
 *
 * Function: EvalOpts(OptTreeNode *, Packet *)
 *
 * Purpose: Implements section 2 of recursive detection engine.  Goes
 *          thru the options chain and see if the current packet matches
 *          any of the rules
 *
 * Arguments: List => the OTN list
 *            p => pointer to the packet data struct
 *
 * Returns: 1 on a match, 0 on no match
 *
 ***************************************************************************/
int EvalOpts(OptTreeNode * List, Packet * p)
{
    if(List == NULL)
        return 0;

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "   => Checking Option Node %d\n",
			    List->chain_node_number););

    if(List->type == RULE_DYNAMIC && !List->active_flag)
    {
#ifdef ITERATIVE_ENGINE
        return 0;
#else
        return EvalOpts(List->next, p);
#endif
    }

    if(List->opt_func == NULL)
    {
        FatalError("List->opt_func was NULL on option #%d!\n", 
                List->chain_node_number);
    }

    if((snort_runtime.capabilities.stateful_inspection == 1) && 
            (List->established == 1) && 
            ((p->packet_flags & PKT_STREAM_EST) == 0))
    {
        /* this OTN requires an established connection and it isn't
         * in that state yet, so continue to the next OTN
         */
        return EvalOpts(List->next, p);
    }

    if(!List->opt_func->OptTestFunc(p, List, List->opt_func))
    {
#ifdef ITERATIVE_ENGINE
        return 0;
#else
        return EvalOpts(List->next, p);
#endif
    }
    else
    {
        /* rule match actions are called from EvalHeader */
        otn_tmp = List;
#ifdef MARTY_BENCHMARKS
        printf("                <!!!> Got OTN detect!\n");
#endif
        return 1;
    }

    return 0;
}


/****************************************************************************
 *
 * Function: DumpChain(RuleTreeNode *, char *, char *)
 *
 * Purpose: print out the chain lists by header block node group
 *
 * Arguments: rtn_idx => the RTN index pointer
 *                       rulename => the name of the rule the list belongs to
 *            listname => the name of the list being printed out
 *
 * Returns: void function
 *
 ***************************************************************************/
void DumpChain(RuleTreeNode * rtn_head, char *rulename, char *listname)
{
    RuleTreeNode *rtn_idx;
    IpAddrSet *idx;  /* indexing pointer */
    int i;
#ifdef DEBUG
    OptTreeNode *otn_idx;
#endif


    
    DEBUG_WRAP(DebugMessage(DEBUG_RULES, "%s %s\n", rulename, listname););

    rtn_idx = rtn_head;

    if(rtn_idx == NULL)
        DEBUG_WRAP(DebugMessage(DEBUG_RULES, "    Empty!\n\n"););

    /* walk thru the RTN list */
    while(rtn_idx != NULL)
    {
        DEBUG_WRAP(
                DebugMessage(DEBUG_RULES, "Rule type: %d\n", rtn_idx->type);
                DebugMessage(DEBUG_RULES, "SRC IP List:\n");
                );
        idx = rtn_idx->sip;
        i = 0;
        while(idx != NULL)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_RULES,
                        "[%d]    0x%.8lX / 0x%.8lX",
                        i++, (u_long) idx->ip_addr,
                        (u_long) idx->netmask););

            if(idx->addr_flags & EXCEPT_IP)
            {
                DEBUG_WRAP(DebugMessage(DEBUG_RULES, 
                            "    (EXCEPTION_FLAG Active)\n"););
            }
            else
            {
                DEBUG_WRAP(DebugMessage(DEBUG_RULES, "\n"););
            }
            idx = idx->next;
        }

        DEBUG_WRAP(DebugMessage(DEBUG_RULES, "DST IP List:\n"););
        idx = rtn_idx->dip;
        i = 0;

        while(idx != NULL)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_RULES,
                        "[%d]    0x%.8lX / 0x%.8lX",
                        i++,(u_long)  idx->ip_addr,
                        (u_long)  idx->netmask););	    
            if(idx->addr_flags & EXCEPT_IP)
            {
                DEBUG_WRAP(DebugMessage(DEBUG_RULES, 
                            "    (EXCEPTION_FLAG Active)\n"););
            }
            else
            {
                DEBUG_WRAP(DebugMessage(DEBUG_RULES, "\n"););
            }

            idx = idx->next;
        }
#ifdef DEBUG
        DebugMessage(DEBUG_RULES, "SRC PORT: %d - %d \n", rtn_idx->lsp, 
                rtn_idx->hsp);
        DebugMessage(DEBUG_RULES, "DST PORT: %d - %d \n", rtn_idx->ldp, 
                rtn_idx->hdp);
        DebugMessage(DEBUG_RULES, "Flags: ");

        if(rtn_idx->flags & EXCEPT_SRC_IP)
            DebugMessage(DEBUG_RULES, "EXCEPT_SRC_IP ");
        if(rtn_idx->flags & EXCEPT_DST_IP)
            DebugMessage(DEBUG_RULES, "EXCEPT_DST_IP ");
        if(rtn_idx->flags & ANY_SRC_PORT)
            DebugMessage(DEBUG_RULES, "ANY_SRC_PORT ");
        if(rtn_idx->flags & ANY_DST_PORT)
            DebugMessage(DEBUG_RULES, "ANY_DST_PORT ");
        if(rtn_idx->flags & EXCEPT_SRC_PORT)
            DebugMessage(DEBUG_RULES, "EXCEPT_SRC_PORT ");
        if(rtn_idx->flags & EXCEPT_DST_PORT)
            DebugMessage(DEBUG_RULES, "EXCEPT_DST_PORT ");
        DebugMessage(DEBUG_RULES, "\n");

        otn_idx = rtn_idx->down;

            DEBUG_WRAP(
                    /* print the RTN header number */
                    DebugMessage(DEBUG_RULES,
                        "Head: %d (type: %d)\n",
                        rtn_idx->head_node_number, otn_idx->type);
                    DebugMessage(DEBUG_RULES, "      |\n");
                    DebugMessage(DEBUG_RULES, "       ->");
                    );

            /* walk thru the OTN chain */
            while(otn_idx != NULL)
            {
                DEBUG_WRAP(DebugMessage(DEBUG_RULES,
                            " %d", otn_idx->chain_node_number););
                otn_idx = otn_idx->next;
            }

        DEBUG_WRAP(DebugMessage(DEBUG_RULES, "|=-\n"););
#endif
        rtn_idx = rtn_idx->right;
    }
}



void IntegrityCheck(RuleTreeNode * rtn_head, char *rulename, char *listname)
{
    RuleTreeNode *rtn_idx = NULL;
    OptTreeNode *otn_idx;
    OptFpList *ofl_idx;
    int opt_func_count;

#ifdef DEBUG
    char chainname[STD_BUF];

    snprintf(chainname, STD_BUF - 1, "%s %s", rulename, listname);

    if(!pv.quiet_flag)
        DebugMessage(DEBUG_DETECT, "%-20s: ", chainname);
#endif

    if(rtn_head == NULL)
    {
#ifdef DEBUG
        if(!pv.quiet_flag)
            DebugMessage(DEBUG_DETECT,"Empty list...\n");
#endif
        return;
    }

    rtn_idx = rtn_head;

    while(rtn_idx != NULL)
    {
        otn_idx = rtn_idx->down;

        while(otn_idx != NULL)
        {
            ofl_idx = otn_idx->opt_func;
            opt_func_count = 0;

            while(ofl_idx != NULL)
            {
                opt_func_count++;
		DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "%p->",ofl_idx->OptTestFunc););
                ofl_idx = ofl_idx->next;
            }

            if(opt_func_count == 0)
            {
                ErrorMessage("ERROR: Got Zero Length List, "
                        "please tell Marty!\n");
#ifndef JUSTDOIT
                exit(1);
#endif
            }
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"\n"););
            otn_idx = otn_idx->next;
        }

        rtn_idx = rtn_idx->right;
    }

#ifdef DEBUG
    if(!pv.quiet_flag)
        DebugMessage(DEBUG_DETECT, "OK\n");
#endif

}



int CheckBidirectional(Packet *p, struct _RuleTreeNode *rtn_idx, 
        RuleFpList *fp_list)
{
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "Checking bidirectional rule...\n"););
    
    if(CheckAddrPort(rtn_idx->sip, rtn_idx->hsp, rtn_idx->lsp, p,
                     rtn_idx->flags, CHECK_SRC))
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "   Src->Src check passed\n"););
        if(! CheckAddrPort(rtn_idx->dip, rtn_idx->hdp, rtn_idx->ldp, p,
                           rtn_idx->flags, CHECK_DST))
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
				    "   Dst->Dst check failed,"
				    " checking inverse combination\n"););
            if(CheckAddrPort(rtn_idx->dip, rtn_idx->hdp, rtn_idx->ldp, p,
                             rtn_idx->flags, (CHECK_SRC | INVERSE)))
            {
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
					"   Inverse Dst->Src check passed\n"););
                if(!CheckAddrPort(rtn_idx->sip, rtn_idx->hsp, rtn_idx->lsp, p,
                                  rtn_idx->flags, (CHECK_DST | INVERSE)))
                {
                    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
					    "   Inverse Src->Dst check failed\n"););
                    return 0;
                }
                else
                {
                    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "Inverse addr/port match\n"););
                }
            }
            else
            {
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "   Inverse Dst->Src check failed,"
					" trying next rule\n"););
                return 0;
            }
        }
        else
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "dest IP/port match\n"););
        }
    }
    else
    {
	DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
				"   Src->Src check failed, trying inverse test\n"););
        if(CheckAddrPort(rtn_idx->dip, rtn_idx->hdp, rtn_idx->ldp, p,
                         rtn_idx->flags, CHECK_SRC | INVERSE))
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                        "   Dst->Src check passed\n"););

            if(! CheckAddrPort(rtn_idx->sip, rtn_idx->hsp, rtn_idx->lsp, p, 
                        rtn_idx->flags, CHECK_DST | INVERSE))
            {
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                            "   Src->Dst check failed\n"););
                return 0;
            }
            else
            {
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                            "Inverse addr/port match\n"););
            }
        }
        else
        { 
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"   Inverse test failed, "
                        "testing next rule...\n"););
            return 0;
        }
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"   Bidirectional success!\n"););
    return 1;
}



/****************************************************************************
 *
 * Function: CheckSrcIpEqual(Packet *, struct _RuleTreeNode *, RuleFpList *)
 *
 * Purpose: Test the source IP and see if it equals the SIP of the packet
 *
 * Arguments: p => ptr to the decoded packet data structure
 *            rtn_idx => ptr to the current rule data struct
 *            fp_list => ptr to the current function pointer node
 *
 * Returns: 0 on failure (no match), 1 on success (match)
 *
 ***************************************************************************/
int CheckSrcIP(Packet * p, struct _RuleTreeNode * rtn_idx, RuleFpList * fp_list)
{
    IpAddrSet *idx; /* ip address indexer */

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"CheckSrcIPEqual: "););

    /* check for global exception flag */
    if(!(rtn_idx->flags & EXCEPT_SRC_IP))
    {
        /* do the check */
        for(idx=rtn_idx->sip; idx != NULL; idx=idx->next)
        {
            if( ((idx->ip_addr == (p->iph->ip_src.s_addr & idx->netmask)) 
                        ^ (idx->addr_flags & EXCEPT_IP)) )
            {
#ifdef DEBUG
                if(idx->addr_flags & EXCEPT_IP) {
                    DebugMessage(DEBUG_DETECT, "  SIP exception match\n");
                } 
                else
                {
                    DebugMessage(DEBUG_DETECT, "  SIP match\n");
                }

                DebugMessage(DEBUG_DETECT, "Rule: 0x%X     Packet: 0x%X\n", 
                        idx->ip_addr, (p->iph->ip_src.s_addr & idx->netmask));
#endif /* DEBUG */

                /* the packet matches this test, proceed to the next test */
                return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
            }
        }
    }
    else
    {
        /* global exception flag is up, we can't match on *any* 
         * of the source addresses 
         */
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"  global exception flag, \n"););

        /* do the check */
        for(idx=rtn_idx->sip; idx != NULL; idx=idx->next)
        {
            if( ((idx->ip_addr == (p->iph->ip_src.s_addr & idx->netmask)) 
                        ^ (idx->addr_flags & EXCEPT_IP)) )
            {
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"address matched, failing on SIP\n"););
                /* got address match on globally negated rule, fail */
                return 0;
            }
        }
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"no matches on SIP, passed\n"););

        return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
    }
    
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"  Mismatch on SIP\n"););

    /* return 0 on a failed test */
    return 0;
}



/****************************************************************************
 *
 * Function: CheckSrcIpNotEq(Packet *, struct _RuleTreeNode *, RuleFpList *)
 *
 * Purpose: Test the source IP and see if it's unequal to the SIP of the
 *          packet
 *
 * Arguments: p => ptr to the decoded packet data structure
 *            rtn_idx => ptr to the current rule data struct
 *            fp_list => ptr to the current function pointer node
 *
 * Returns: 0 on failure (no match), 1 on success (match)
 *
 ***************************************************************************/
int CheckSrcIPNotEq(Packet *p, struct _RuleTreeNode *rtn_idx, 
        RuleFpList *fp_list)
{
    IpAddrSet *idx;  /* IP address indexer */
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "CheckSrcIPNotEq: "););

    /* do the check */
    for(idx=rtn_idx->sip; idx != NULL; idx=idx->next)
    {
        if( idx->ip_addr != (p->iph->ip_src.s_addr & idx->netmask) )
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "  SIP exception match\n"););
            /* the packet matches this test, proceed to the next test */
            return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
        }
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "  Mismatch on SIP\n"););
    
    /* return 0 on a failed test */
    return 0;
}



/****************************************************************************
 *
 * Function: CheckDstIpEqual(Packet *, struct _RuleTreeNode *, RuleFpList *)
 *
 * Purpose: Test the dest IP and see if it equals the DIP of the packet
 *
 * Arguments: p => ptr to the decoded packet data structure
 *            rtn_idx => ptr to the current rule data struct
 *            fp_list => ptr to the current function pointer node
 *
 * Returns: 0 on failure (no match), 1 on success (match)
 *
 ***************************************************************************/
int CheckDstIP(Packet *p, struct _RuleTreeNode *rtn_idx, RuleFpList *fp_list)
{
    IpAddrSet *idx;  /* ip address indexer */

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "CheckDstIPEqual: ");)

    /* check for global exception flag */
    if(!(rtn_idx->flags & EXCEPT_DST_IP))
    {
        /* do the check */
        for(idx=rtn_idx->dip; idx != NULL; idx=idx->next)
        {
            if( ((idx->ip_addr == (p->iph->ip_dst.s_addr & idx->netmask)) 
                        ^ (idx->addr_flags & EXCEPT_IP)) )
            {
#ifdef DEBUG
                if(idx->addr_flags & EXCEPT_IP)
                {
                    DebugMessage(DEBUG_DETECT, "  DIP exception match\n");
                }
                else
                {
                    DebugMessage(DEBUG_DETECT, "  DIP match\n");
                }
                
                DebugMessage(DEBUG_DETECT, "Rule: 0x%X     Packet: 0x%X\n", 
                        idx->ip_addr, (p->iph->ip_src.s_addr & idx->netmask));
#endif /* DEBUG */
                /* the packet matches this test, proceed to the next test */
                return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
            }
        }
    }
    else
    {
        /* global exception flag is up, we can't match on *any* 
         * of the source addresses 
         */
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "  global exception flag, \n"););

        /* do the check */
        for(idx=rtn_idx->dip; idx != NULL; idx=idx->next)
        {
            if( ((idx->ip_addr == (p->iph->ip_dst.s_addr & idx->netmask)) 
                        ^ (idx->addr_flags & EXCEPT_IP)) )
            {
                DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
					"address matched, failing on DIP\n"););
                /* got address match on globally negated rule, fail */
                return 0;
            }
        }
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "no matches on DIP, passed\n"););

        return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "  Mismatch on DIP\n"););
    /* return 0 on a failed test */
    return 0;
}


/****************************************************************************
 *
 * Function: CheckDstIpNotEq(Packet *, struct _RuleTreeNode *, RuleFpList *)
 *
 * Purpose: Test the dest IP and see if it equals the DIP of the packet
 *
 * Arguments: p => ptr to the decoded packet data structure
 *            rtn_idx => ptr to the current rule data struct
 *            fp_list => ptr to the current function pointer node
 *
 * Returns: 0 on failure (no match), 1 on success (match)
 *
 ***************************************************************************/
int CheckDstIPNotEq(Packet *p, struct _RuleTreeNode *rtn_idx, 
        RuleFpList *fp_list)
{
    IpAddrSet *idx; /* ip address indexer */

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"CheckDstIPNotEq: "););

    /* same as above */
    for(idx=rtn_idx->dip;idx != NULL; idx=idx->next)
    {
        if( idx->ip_addr != (p->iph->ip_dst.s_addr & idx->netmask) )
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"  DIP exception match\n"););
            return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
        }
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"  Mismatch on DIP\n"););

    return 0;
}



int CheckSrcPortEqual(Packet *p, struct _RuleTreeNode *rtn_idx, 
        RuleFpList *fp_list)
{
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"CheckSrcPortEqual: "););

    if( (p->sp <= rtn_idx->hsp) && (p->sp >= rtn_idx->lsp) )
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "  SP match!\n"););
        return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
    }
    else
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "   SP mismatch!\n"););
    }

    return 0;
}





int CheckSrcPortNotEq(Packet *p, struct _RuleTreeNode *rtn_idx, 
        RuleFpList *fp_list)
{
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "CheckSrcPortNotEq: "););

    if( (p->sp > rtn_idx->hsp) || (p->sp < rtn_idx->lsp) )
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "  SP exception match!\n"););
        return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
    }
    else
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"   SP mismatch!\n"););
    }

    return 0;
}





int CheckDstPortEqual(Packet *p, struct _RuleTreeNode *rtn_idx, 
        RuleFpList *fp_list)
{
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"CheckDstPortEqual: "););

    if( (p->dp <= rtn_idx->hdp) && (p->dp >= rtn_idx->ldp) )
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, " DP match!\n"););
        return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
    }
    else
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT," DP mismatch!\n"););
    }
    return 0;
}




int CheckDstPortNotEq(Packet *p, struct _RuleTreeNode *rtn_idx, 
        RuleFpList *fp_list)
{
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "CheckDstPortNotEq: "););

    if( (p->dp > rtn_idx->hdp) || (p->dp < rtn_idx->ldp) )
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT," DP exception match!\n"););
        return fp_list->next->RuleHeadFunc(p, rtn_idx, fp_list->next);
    }
    else
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT," DP mismatch!\n"););
    }

    return 0;
}



int RuleListEnd(Packet *p, struct _RuleTreeNode *rtn_idx, RuleFpList *fp_list)
{
    return 1;
}


int OptListEnd(Packet *p, struct _OptTreeNode *otn_idx, OptFpList *fp_list)
{
    return 1;
}


void CreateDefaultRules()
{
    CreateRuleType("activation", RULE_ACTIVATE, 1, &Activation);
    CreateRuleType("dynamic", RULE_DYNAMIC, 1, &Dynamic);
    CreateRuleType("alert", RULE_ALERT, 1, &Alert);
    CreateRuleType("pass", RULE_PASS, 0, &Pass);
    CreateRuleType("log", RULE_LOG, 1, &Log);
}

void printRuleOrder()
{
    LogMessage("Rule application order: ");
    printRuleListOrder(RuleLists);
}

/****************************************************************************
 *
 * Function: CreateRuleType
 *
 * Purpose: Creates a new type of rule and adds it to the end of the rule list
 *
 * Arguments: name = name of this rule type
 *                       mode = the mode for this rule type
 *                   rval = return value for this rule type (for detect events)
 *                       head = list head to use (or NULL to create a new one)
 *
 * Returns: the ListHead for the rule type
 *
 ***************************************************************************/
ListHead *CreateRuleType(char *name, int mode, int rval, ListHead * head)
{
    RuleListNode *node;

    /*
     * if this is the first rule list node, then we need to create a new
     * list. we do not allow multiple rules with the same name.
     */
    if( RuleLists == NULL )
    {
        RuleLists = (RuleListNode *) malloc(sizeof(RuleListNode));
        node = RuleLists;
    }
    else
    {
        node = RuleLists;

        while( 1 )
        {
            if( !strcmp(node->name, name) )
                return NULL;
            if( node->next == NULL )
                break;
            node = node->next;
        }

        node->next = (RuleListNode *) malloc(sizeof(RuleListNode));
        node = node->next;
    }

    if( head == NULL )
    {
        node->RuleList = (ListHead *) malloc(sizeof(ListHead));
        node->RuleList->IpList = NULL;
        node->RuleList->TcpList = NULL;
        node->RuleList->UdpList = NULL;
        node->RuleList->IcmpList = NULL;
        node->RuleList->LogList = NULL;
        node->RuleList->AlertList = NULL;
    }
    else
    {
        node->RuleList = head;
    }

    node->mode = mode;
    node->rval = rval;
    node->name = strdup(name);
    node->next = NULL;

    return node->RuleList;
}



/****************************************************************************
 *
 * Function: OrderRuleLists
 *
 * Purpose: Orders the rule lists into the specefied order.
 *
 * Returns: void function
 *
 ***************************************************************************/
void OrderRuleLists(char *order)
{
    int i;
    RuleListNode *ordered_list = NULL;
    RuleListNode *prev;
    RuleListNode *node;
    static int called = 0;
    char **toks;
    int num_toks;

    if( called > 0 )
        LogMessage("Warning: multiple rule order directives.\n");

    toks = mSplit(order, " ", 10, &num_toks, 0);

    for( i = 0; i < num_toks; i++ )
    {
        prev = NULL;
        node = RuleLists;

        while( 1 )
        {
            if( node == NULL )
            {
                printf("ERROR: ruletype %s does not exist or "
                        "has already been ordered.\n", toks[i]);
                break;
            }
            if( !strcmp(toks[i], node->name) )
            {
                if( prev == NULL )
                    RuleLists = node->next;
                else
                    prev->next = node->next;
                /* Add node to ordered list */
                ordered_list = addNodeToOrderedList(ordered_list, node);
                break;
            }
            else
            {
                prev = node;
                node = node->next;
            }
        }
    }

    /* anything left in the rule lists needs to be moved to the ordered lists */
    while( RuleLists != NULL )
    {
        node = RuleLists;
        RuleLists = node->next;
        /* Add node to ordered list */
        ordered_list = addNodeToOrderedList(ordered_list, node);
    }

    /* set the rulelists to the ordered list */
    RuleLists = ordered_list;
    called = 1;
}

RuleListNode *addNodeToOrderedList(RuleListNode * ordered_list, 
        RuleListNode * node)
{
    RuleListNode *prev;

    prev = ordered_list;

    if( prev == NULL )
    {
        ordered_list = node;}
    else{
        while( prev->next != NULL )
            prev = prev->next;
        prev->next = node;
    }

    node->next = NULL;

    return ordered_list;
}


void printRuleListOrder(RuleListNode * node)
{
    while( node != NULL )
    {
        printf("->%s", node->name);
        node = node->next;
    }

    printf("\n");
}

/* Rule Match Action Functions */
int PassAction()
{
    pc.pass_pkts++;

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"   => Pass rule, returning...\n"););
    return 1;
}



int ActivateAction(Packet * p, OptTreeNode * otn, Event *event)
{
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
			    "        <!!> Activating and generating alert! \"%s\"\n",
			    otn->sigInfo.message););
    CallAlertFuncs(p, otn->sigInfo.message, otn->rtn->listhead, event);

    if (otn->OTN_activation_ptr == NULL)
    {
        LogMessage("WARNING: an activation rule with no "
                "dynamic rules matched!\n");
        return 0;
    }

    otn->OTN_activation_ptr->active_flag = 1;
    otn->OTN_activation_ptr->countdown = 
        otn->OTN_activation_ptr->activation_counter;

    otn->RTN_activation_ptr->active_flag = 1;
    otn->RTN_activation_ptr->countdown += 
        otn->OTN_activation_ptr->activation_counter;

    active_dynamic_nodes++;

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                "   => Finishing activation packet!\n"););
    
    CallLogFuncs(p, otn->sigInfo.message, otn->rtn->listhead, event);

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, 
                "   => Activation packet finished, returning!\n"););

    return 1;
}




int AlertAction(Packet * p, OptTreeNode * otn, Event *event)
{
    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                "        <!!> Generating alert! \"%s\"\n", 
                otn->sigInfo.message););

    CallAlertFuncs(p, otn->sigInfo.message, otn->rtn->listhead, event);

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "   => Finishing alert packet!\n"););

    if(p->ssnptr != NULL)
    {
        if(AlertFlushStream(p, p->ssnptr) == 0)
        {
            CallLogFuncs(p, otn->sigInfo.message, otn->rtn->listhead, event);
        }
    }
    else
    {
        CallLogFuncs(p, otn->sigInfo.message, otn->rtn->listhead, event);
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                "   => Alert packet finished, returning!\n"););

    return 1;
}



int DynamicAction(Packet * p, OptTreeNode * otn, Event *event)
{
    RuleTreeNode *rtn = otn->rtn;

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT, "   => Logging packet data and"
			    " adjusting dynamic counts (%d/%d)...\n",
			    rtn->countdown, otn->countdown););

    CallLogFuncs(p, otn->sigInfo.message, otn->rtn->listhead, event);

    otn->countdown--;

    if( otn->countdown <= 0 )
    {
        otn->active_flag = 0;
        active_dynamic_nodes--;
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, 
                    "   <!!> Shutting down dynamic OTN node\n"););
    }
    
    rtn->countdown--;

    if( rtn->countdown <= 0 )
    {
        rtn->active_flag = 0;
        DEBUG_WRAP(DebugMessage(DEBUG_DETECT, 
                    "   <!!> Shutting down dynamic RTN node\n"););
    }

    return 1;
}

int LogAction(Packet * p, OptTreeNode * otn, Event *event)
{

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,
                "   => Logging packet data and returning...\n"););

    CallLogFuncs(p, otn->sigInfo.message, otn->rtn->listhead, event);

#ifdef BENCHMARK
    printf("        <!!> Check count = %d\n", check_count);
    check_count = 0;
    printf(" **** cmpcount: %d **** \n", cmpcount);
#endif

    return 1;
}

void TriggerResponses(Packet * p, OptTreeNode * otn)
{

    RspFpList *idx;

    idx = otn->rsp_func;

    DEBUG_WRAP(DebugMessage(DEBUG_DETECT,"Triggering responses %p\n", idx););

    while(idx != NULL)
    {
        idx->ResponseFunc(p, idx);
        idx = idx->next;
    }

}

/* end of rule action functions */
