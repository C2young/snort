/* $Id: spp_frag2.c,v 1.48 2002/08/19 17:33:01 roesch Exp $ */

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
/*
 * Bugfixes;
 *
 *  Aug  1 15:28:36 MDT 2001, cpw: changed to use packet time for all time
 *  comparisons.  Modified calling sequence on a number subroutines to
 *  pass down current FragTracker and time to PruneFragCache.  The
 *  current FragTracker was getting released early by PruneFragCache
 *  which led to a segmentation fault.  I'd suggest a look see at
 *  PruneFragCache to see that is doing things in the right order.  Not
 *  knowing how it all works, I assumed that the loop was from oldest to
 *  newest.
 *  Using snort compiled with this version I was able to successfully
 *  process a gaggle of frags (GOF).  An individual packet looked like this:
 *  14:11:21.020324 a.11071 > b.11070: udp 8000 (frag 62829:1480@0+)
 *  14:11:21.020327 a > b: frag 1480 (frag 62829:1480@1480+)
 *  14:11:21.020329 a > b: frag 1480 (frag 62829:1480@2960+)
 *  14:11:21.020412 a > b: frag 1480 (frag 62829:1480@4440+)
 *  14:11:21.020416 a > b: frag 1480 (frag 62829:1480@5920+)
 *  14:11:21.020418 a > 134.253.164.21: frag 608 (frag 62829:608@7400)
 *  There were about 301066 full packets read from a 821947618 byte file.
 *
 *  Prior to this patch, I got the following seg fault:
 *  #0  ubi_btInsert (RootPtr=0x48, NewNode=0x8a94f10, ItemPtr=0x8a94f10,
 *      OldNode=0xbfffee7c) at ubi_BinTree.c:637
 *  #1  0x8077825 in ubi_sptInsert (RootPtr=0x48, NewNode=0x8a94f10,
 *      ItemPtr=0x8a94f10, OldNode=0x0) at ubi_SplayTree.c:317
 *  #2  0x807c08e in InsertFrag (p=0xbfffef5c, ft=0x874bdc8) at spp_frag2.c:534
 *  #3  0x807be82 in Frag2Defrag (p=0xbfffef5c) at spp_frag2.c:430
 *  #4  0x8058416 in Preprocess (p=0xbfffef5c) at rules.c:3427
 *  ...
 */

/*  I N C L U D E S  ************************************************/
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif


#include <sys/types.h>
#include <stdlib.h>
#include <ctype.h>
#include <rpc/types.h>

#include "generators.h"
#include "log.h"
#include "detect.h"
#include "decode.h"
#include "event.h"
#include "util.h"
#include "debug.h"
#include "plugbase.h"
#include "parser.h"
#include "mstring.h"
#include "checksum.h"

#include "ubi_BinTree.h"
#include "ubi_SplayTree.h"

#include "snort.h"

void Frag2Init(u_char *args);

/*  D E F I N E S  **************************************************/
#define FRAG_GOT_FIRST      0x00000001
#define FRAG_GOT_LAST       0x00000002
#define FRAG_REBUILT        0x00000004
#define FRAG_OUTOFORDER     0x00000008 /* did we get other frags than
					  MF Offset 0 first? */

#define FRAG_PRUNE_QUANTA   60
#define FRAG_MEMCAP         4194304

#define FRAG2_TTL_LIMIT      5
#define FRAG2_MIN_TTL        0

#if defined (SOLARIS) || defined (SUNOS)
#define SPARC_TWIDDLE       2
#else
#define SPARC_TWIDDLE       0
#endif

/*  D A T A   S T R U C T U R E S  **********************************/
typedef struct _Frag2Data
{
    u_int8_t os_flags;
    u_int32_t memcap;
    u_int32_t frag_timeout;
    u_int32_t last_prune_time;
    u_int8_t stop_traverse;

    u_int8_t min_ttl; /* Minimum TTL to accept */
    u_int8_t ttl_limit; /* Size of ttls to avoid detection on */
    char frag2_alerts; /* Wether or not frag2 alerts are enabled */

    u_int16_t frag_pad;
} Frag2Data;


typedef struct _Frag2Frag
{
    ubi_trNode Node;
    
    u_int8_t *data;
    u_int16_t size;
    u_int16_t offset;
} Frag2Frag;

typedef struct _FragTracker
{
    ubi_trNode Node;

    u_int32_t sip;          /* src IP */
    u_int32_t dip;          /* dst IP */
    u_int16_t id;           /* IP ID */
    u_int8_t protocol;      /* IP protocol */

    u_int8_t ttl;  /* ttl used to detect evasions */

    u_int32_t frag_flags;
    u_int32_t last_frag_time;

    u_int32_t frag_bytes;
    u_int32_t calculated_size;
    u_int32_t frag_pkts;
    
    ubi_trRoot fraglist;
    ubi_trRootPtr fraglistPtr;
} FragTracker;

typedef struct _CompletionData
{
    u_int8_t complete;
    u_int8_t teardrop;
    u_int8_t outoforder;
} CompletionData;

/*  G L O B A L S  **************************************************/
static ubi_trRoot f_cache;
static ubi_trRootPtr FragRootPtr = &f_cache;
    
extern char *file_name;
extern int file_line;

int frag_mem_usage;

u_int16_t next_offset;
u_int32_t frag2_alloc_faults;

Frag2Data f2data;
Packet *defrag_pkt;


/*  P R O T O T Y P E S  ********************************************/
void ParseFrag2Args(u_char *);
void Frag2Defrag(Packet *);
FragTracker *GetFragTracker(Packet *);
FragTracker *NewFragTracker(Packet *);
int InsertFrag(Packet *, FragTracker *);
int FragIsComplete(FragTracker *, CompletionData *);
void RebuildFrag(FragTracker *, Packet *);
void Frag2DeleteFrag(FragTracker *);
int PruneFragCache(FragTracker *, u_int32_t, u_int32_t);
void ZapFrag(FragTracker *);
void Frag2InitPkt();
void Frag2CleanExit(int, void *);
void Frag2Restart(int, void *);

void *Frag2Alloc(FragTracker *cft, int tv_sec, u_int32_t size)
{
    void *tmp;

    frag_mem_usage += size;

    /* if we use up all of our RAM, try to free up some stale frags */
    if( (u_int32_t)frag_mem_usage > f2data.memcap)
    {

        frag2_alloc_faults++;
        pc.frag_mem_faults++;

        if(!PruneFragCache(cft, (u_int32_t)tv_sec, 0))
        {
            /* if we can't prune due to time, just nuke 5 random sessions */
            PruneFragCache(cft, 0, 5);
        }
    }

    tmp = (void *) calloc(size, sizeof(char));

    if(tmp == NULL)
    {
        FatalError("spp_defrag: Unable to allocate memory! "
                "(%u bytes in use)\n", frag_mem_usage);
    }

    return tmp;
}


static int Frag2CompareFunc(ubi_trItemPtr ItemPtr, ubi_trNodePtr NodePtr)
{
    FragTracker *nFt;
    FragTracker *iFt;

    nFt = (FragTracker *) NodePtr;
    iFt = (FragTracker *) ItemPtr;

    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2,"NodePtr: sip: 0x%X  dip: 0x%X  ip: 0x%X  "
                "proto: 0x%X\n", nFt->sip, nFt->dip, nFt->id, nFt->protocol);
            DebugMessage(DEBUG_FRAG2,"ItemPtr: sip: 0x%X  dip: 0x%X  ip: 0x%X  "
                "proto: 0x%X\n", iFt->sip, iFt->dip, iFt->id, iFt->protocol););

    if(nFt->sip < iFt->sip) return 1;
    if(nFt->sip > iFt->sip) return -1;
    if(nFt->dip < iFt->dip) return 1;
    if(nFt->dip > iFt->dip) return -1;
    if(nFt->id < iFt->id) return 1;
    if(nFt->id > iFt->id) return -1;
    if(nFt->protocol < iFt->protocol) return 1;
    if(nFt->protocol > iFt->protocol) return -1;

    return 0;
}


static int Frag2FragCompare(ubi_trItemPtr ItemPtr, ubi_trNodePtr NodePtr)
{
    Frag2Frag *nFrag;
    Frag2Frag *iFrag;

    nFrag = (Frag2Frag *) NodePtr;
    iFrag = (Frag2Frag *) ItemPtr;

    if(nFrag->offset < iFrag->offset) return 1;
    if(nFrag->offset > iFrag->offset) return -1;

    return 0;
}



static void CompletionTraverse(ubi_trNodePtr NodePtr, void *complete)
{
    Frag2Frag *frag;
    CompletionData *comp = (CompletionData *) complete;

    frag = (Frag2Frag *) NodePtr;

    if(frag->offset == next_offset)
    {
        next_offset = frag->offset + frag->size;
    }
    else if(frag->offset < next_offset)
    {
        if(frag->size < next_offset)
        {
            /* flag a teardrop attack detection */
            comp->teardrop = 1;
        }
    }
    else if(frag->offset > next_offset)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Holes in completion check...\n"););
        comp->complete = 0;
    }

    return;
}

static void RebuildTraverse(ubi_trNodePtr NodePtr, void *buffer)
{
    Frag2Frag *frag;
    u_int8_t *buf = (u_int8_t *)buffer;

    if(f2data.stop_traverse)
        return;

    frag = (Frag2Frag *)NodePtr;

    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "frag offset: 0x%X  size: %lu  pointer: %p\n", 
                (unsigned int) frag->offset, (unsigned long) frag->size,
                (buf+frag->offset)););

    if((frag->offset + frag->size) < 65516)
    {
        memcpy(buf+frag->offset, frag->data, frag->size);
        pc.rebuild_element++;
    }
    else
    {
        DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "frag2: pkt rebuild size violation\n"););
        f2data.stop_traverse = 1;
    }

    return;
}

static void KillFrag(ubi_trNodePtr NodePtr)
{
    Frag2Frag *frag;

    frag = (Frag2Frag *) NodePtr;

    frag_mem_usage -= frag->size;
    free(frag->data);

    frag_mem_usage -= sizeof(Frag2Frag);
    free(frag);
    
}


void SetupFrag2()
{
    RegisterPreprocessor("frag2", Frag2Init);
    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Preprocessor: frag2 is setup...\n"););
}


void Frag2Init(u_char *args)
{

    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Initializing frag2\n"););

    f2data.last_prune_time = 0;
    f2data.frag2_alerts = 0;
    f2data.min_ttl = FRAG2_MIN_TTL;
    f2data.ttl_limit = FRAG2_TTL_LIMIT;
    
    ParseFrag2Args(args);

    (void)ubi_trInitTree(FragRootPtr,        /* ptr to the tree head */
                         Frag2CompareFunc,   /* comparison function */
                         0);                 /* no dups */

    defrag_pkt = (Packet *)calloc(sizeof(Packet), sizeof(char));
    Frag2InitPkt();

    AddFuncToPreprocList(Frag2Defrag);
    AddFuncToCleanExitList(Frag2CleanExit, NULL);
    AddFuncToRestartList(Frag2Restart, NULL);
}


void ParseFrag2Args(u_char *args)
{
    char **toks;
    int num_toks;
    int i;
    char *index;
    char **stoks = NULL;
    int s_toks;

    if(args == NULL || strlen(args) == 0)
    {
        f2data.memcap = FRAG_MEMCAP;  /* 4MB */
        f2data.frag_timeout = FRAG_PRUNE_QUANTA; /* 60 seconds */
        f2data.ttl_limit = FRAG2_TTL_LIMIT;
        f2data.min_ttl = FRAG2_MIN_TTL;
        f2data.frag2_alerts = 0;

        if(!pv.quiet_flag)
        {
            LogMessage("No arguments to frag2 directive, "
                    "setting defaults to:\n");
            LogMessage("    Fragment timeout: %d seconds\n", 
                    f2data.frag_timeout);
            LogMessage("    Fragment memory cap: %lu bytes\n", (unsigned long)f2data.memcap);
            LogMessage("    Fragment min_ttl:   %d\n", f2data.min_ttl);
            LogMessage("    Fragment ttl_limit: %d\n", f2data.ttl_limit);
            LogMessage("    Fragment Problems: %d\n", f2data.frag2_alerts);
        }

        return;
    }
    else
    {
        f2data.memcap = FRAG_MEMCAP;  
        f2data.frag_timeout = FRAG_PRUNE_QUANTA; 

        toks = mSplit(args, ",", 12, &num_toks, 0);

        i=0;

        while(i < num_toks)
        {
            index = toks[i];

            while(isspace((int)*index)) index++;

            stoks = mSplit(index, " ", 4, &s_toks, 0);

            if(!strncasecmp(stoks[0], "timeout", 7))
            {
                if(stoks[1] && isdigit((int)stoks[1][0]))
                {
                    f2data.frag_timeout = atoi(stoks[1]);
                }
                else
                {
                    LogMessage("WARNING %s(%d) => Bad timeout in config file, "
                            "defaulting to %d seconds\n", file_name, file_line, FRAG_PRUNE_QUANTA);

                    f2data.frag_timeout = FRAG_PRUNE_QUANTA;
                }
            }
            else if(!strncasecmp(stoks[0], "memcap", 6))
            {
                if(stoks[1] && isdigit((int)stoks[1][0]))
                {
                    f2data.memcap = atoi(stoks[1]);

                    if(f2data.memcap < 16384)
                    {
                        LogMessage("WARNING %s(%d) => Ludicrous (<16k) memcap "
                                "size, setting to default (%d bytes)\n", 
                                file_name, file_line, FRAG_MEMCAP);

                        f2data.memcap = FRAG_MEMCAP;
                    }
                }
                else
                {
                    LogMessage("WARNING %s(%d) => Bad memcap in config file, "
                            "defaulting to %u bytes\n", file_name, file_line, 
                            FRAG_MEMCAP);

                    f2data.memcap = FRAG_MEMCAP;
                }
            }
            else if(!strcasecmp(stoks[0], "ttl_limit"))
            {
                if(isdigit((int)stoks[1][0]))
                {
                    f2data.ttl_limit = atoi(stoks[1]);
                }
                else
                {
                    LogMessage("WARNING %s(%d) => Bad TTL Limit"
                            "size, setting to default (%d\n", file_name, 
                            file_line, FRAG2_TTL_LIMIT);

                    f2data.ttl_limit = FRAG2_TTL_LIMIT;
                }
            }
            else if(!strcasecmp(stoks[0], "min_ttl"))
            {
                if(isdigit((int)stoks[1][0]))
                {
                    f2data.min_ttl = atoi(stoks[1]);
                }
                else
                {
                    LogMessage("WARNING %s(%d) => Bad TTL Limit"
                            "size, setting to default (%d\n", file_name, 
                            file_line, FRAG2_MIN_TTL);

                    f2data.min_ttl = FRAG2_MIN_TTL;
                }
            }
            else if(!strcasecmp(stoks[0], "detect_state_problems"))
            {
                f2data.frag2_alerts = 1;
            }

            do
            {
                s_toks--;
                if(stoks[s_toks])
                {
                    free(stoks[s_toks]);
                }
            } while(s_toks);

            i++;
        }

        do
        {
            num_toks--;
            free(toks[num_toks]);
        }while(num_toks);

        LogMessage("[*] Frag2 config:\n");
        LogMessage("    Fragment timeout: %d seconds\n", 
                f2data.frag_timeout);
        LogMessage("    Fragment memory cap: %lu bytes\n", (unsigned long)f2data.memcap);
        LogMessage("    Fragment min_ttl:   %d\n", f2data.min_ttl);
        LogMessage("    Fragment ttl_limit: %d\n", f2data.ttl_limit);
        LogMessage("    Fragment Problems: %d\n", f2data.frag2_alerts);
    }
}

void Frag2Defrag(Packet *p)
{
    FragTracker *ft;
    Event event;

    /* make sure we're interested in this packet */
    if(p == NULL || p->iph == NULL || !p->frag_flag) 
    {
        return;
    }

    if(p->packet_flags & PKT_REBUILT_FRAG)
    {
        return;
    }

    if(p->ip_options_len)
    {
        if(f2data.frag2_alerts)
        {
            SetEvent(&event, GENERATOR_SPP_FRAG2, 
                    FRAG2_IPOPTIONS, 1, 0, 5, 0);
            CallAlertFuncs(p, FRAG2_IPOPTIONS_STR,NULL, &event);
            CallLogFuncs(p, FRAG2_IPOPTIONS_STR, NULL, &event);
            return;
        }
    }

    if(p->iph->ip_ttl < f2data.min_ttl)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Got frag packet (mem use: %lu frag "
                    "trackers: %d  p->pkt_flags: 0x%X)\n", frag_mem_usage, 
                    ubi_trCount(FragRootPtr), p->packet_flags););
        return;
    }


    if (!f2data.last_prune_time)
        f2data.last_prune_time = p->pkth->ts.tv_sec;

    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Got frag packet (mem use: %lu frag "
                "trackers: %d  p->pkt_flags: 0x%X)\n", frag_mem_usage, 
                ubi_trCount(FragRootPtr), p->packet_flags););

    ft = GetFragTracker(p);

    if(ft == NULL)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Didn't find frag packet\n"););
        DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Adding New FragTracker...\n"););

        ft = NewFragTracker(p);

        if(ft == NULL)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Discarding fragment, "
                        "unable to generate new FragTracker\n"););
        }

        return;
    }

    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Found frag packet\n"););

    /* detect ttl based evasion techniques */
    if(f2data.ttl_limit) 
    {
        /* ft->ttl is already set in the ft a few lines above */
        if(abs(ft->ttl - p->iph->ip_ttl) >= f2data.ttl_limit) 
        {
            SetEvent(&event, GENERATOR_SPP_FRAG2, 
                    FRAG2_TTL_EVASION, 1, 0, 5, 0);
            CallAlertFuncs(p, FRAG2_TTL_EVASION_STR, NULL, &event);
            CallLogFuncs(p, FRAG2_TTL_EVASION_STR, NULL, &event);
            /* lets just go look at real events from now on. */
            return;
        }
    }

    if(InsertFrag(p, ft) == -1)
    {
        LogMessage("WARNING: Insert into Fraglist failed, "
                "probably duplicate fragment (offset: %u)\n", p->frag_offset);
    }
    else
    {
        CompletionData compdata;

        compdata.complete = 0;
        compdata.teardrop = 0;
        compdata.outoforder = 0;

        if(FragIsComplete(ft, &compdata))
        {
            if(compdata.teardrop)
            {
                SetEvent(&event, GENERATOR_SPP_FRAG2, 
                        FRAG2_TEARDROP, 1, 0, 5, 0);
                CallAlertFuncs(p, FRAG2_TEARDROP_STR, NULL, &event);
                CallLogFuncs(p, FRAG2_TEARDROP_STR, NULL, &event);
            }
            else if(f2data.frag2_alerts &&
                    compdata.outoforder &&
                    !(p->packet_flags & PKT_FRAG_ALERTED))
            {
                SetEvent(&event, GENERATOR_SPP_FRAG2, 
                        FRAG2_OUTOFORDER, 1, 0, 5, 0);
                CallAlertFuncs(p, FRAG2_OUTOFORDER_STR, NULL, &event);
                CallLogFuncs(p, FRAG2_OUTOFORDER_STR, NULL, &event);
                p->packet_flags |= PKT_FRAG_ALERTED;
                return;
            }

            RebuildFrag(ft, p);
        } 
        else 
        {
            DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Fragment not complete\n"););
        }
    }

    if( (u_int32_t)(p->pkth->ts.tv_sec) > 
            (f2data.last_prune_time + f2data.frag_timeout))
    {
        DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Prune time quanta for defrag "
                    "code hit, pruning frag tree...\n"););
        PruneFragCache(ft, p->pkth->ts.tv_sec, 0);
        DEBUG_WRAP(DebugMessage(DEBUG_FRAG2,  "Finished pruning, %lu frag "
                    "trackers " "active, %lu alloc faults\n", 
                    ubi_trCount(FragRootPtr), 
                    (unsigned long) frag2_alloc_faults););

        f2data.last_prune_time = p->pkth->ts.tv_sec;
    }

    return;
}



FragTracker *GetFragTracker(Packet *p)
{
    FragTracker ft;
    FragTracker *returned;

    if(ubi_trCount(FragRootPtr) == 0)
        return NULL;

    if(frag_mem_usage == 0)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "trCount says nodes exist but "
				"frag_mem_usage = 0\n"););
        return NULL;
    }
                
    ft.sip = p->iph->ip_src.s_addr;
    ft.dip = p->iph->ip_dst.s_addr;
    ft.id = p->iph->ip_id;
    ft.protocol = p->iph->ip_proto;
    
    returned = (FragTracker *) ubi_sptFind(FragRootPtr, (ubi_btItemPtr)&ft);
    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "returning %p\n", returned););
    
    return returned;
}


FragTracker *NewFragTracker(Packet *p)
{
    FragTracker *tmp;
    /* allocate space for a frag tracker */
    tmp = Frag2Alloc(NULL, p->pkth->ts.tv_sec, sizeof(FragTracker));

    /* set the frag tracker data fields */
    tmp->sip = p->iph->ip_src.s_addr;
    tmp->dip = p->iph->ip_dst.s_addr;
    tmp->id = p->iph->ip_id;
    tmp->protocol = p->iph->ip_proto;

    tmp->fraglistPtr = &tmp->fraglist;

    tmp->ttl = p->iph->ip_ttl; /* store the first ttl we got */
    
    /* initialize the fragment list */
    (void)ubi_trInitTree(tmp->fraglistPtr,    /* ptr to the tree head */
                         Frag2FragCompare,    /* comparison function */
                         0);                  /* dups ok */

    /* insert the fragment into the frag list */
    if(InsertFrag(p, tmp) != -1)
    {
        /* insert the frag tracker into the fragment tree */
        if(ubi_sptInsert(FragRootPtr, (ubi_btNodePtr)tmp, 
                    (ubi_btNodePtr)tmp, NULL) == FALSE)
        {
            LogMessage("NewFragTracker: sptInsert() failed\n");
            Frag2DeleteFrag(tmp);
            return NULL;
        }
    }
    else
    {
        frag_mem_usage -= sizeof(FragTracker);
        free(tmp);
        return NULL;
    }

    pc.frag_trackers++;

    return tmp;
}


int InsertFrag(Packet *p, FragTracker *ft)
{
    Frag2Frag *returned;
    Frag2Frag *killme = NULL;
    Frag2Frag *newfrag;
    Event event;

    /* set the frag flag if this is the first fragment */
    if(p->mf && p->frag_offset == 0)
    {
	if(ft->frag_flags & FRAG_GOT_FIRST)
	{
            if(f2data.frag2_alerts)
            {
                SetEvent(&event, GENERATOR_SPP_FRAG2, 
                         FRAG2_DUPFIRST, 1, 0, 5, 0);
                CallAlertFuncs(p, FRAG2_DUPFIRST_STR, NULL, &event);
                CallLogFuncs(p, FRAG2_DUPFIRST_STR,  NULL, &event);
                p->packet_flags |= PKT_FRAG_ALERTED;
            }
	    return 0;
	} else {
	    ft->frag_flags |= FRAG_GOT_FIRST;
	}
    }
    else if(!p->mf && p->frag_offset > 0)
    {
        ft->frag_flags |= FRAG_GOT_LAST;
        ft->calculated_size = (p->frag_offset << 3) + p->dsize;

        if(ft->calculated_size > 65516)
        {
            SetEvent(&event, GENERATOR_SPP_FRAG2, 
                    FRAG2_OVERSIZE_FRAG, 1, 0, 5, 0);
            CallAlertFuncs(p, FRAG2_OVERSIZE_FRAG_STR, NULL, &event);
            CallLogFuncs(p, FRAG2_OVERSIZE_FRAG_STR, NULL, &event);
	    return 0;
        }
	
    }

    if(!(ft->frag_flags & FRAG_GOT_FIRST))
    {
	DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "setting out of order!"););
	ft->frag_flags |= FRAG_OUTOFORDER;
    }

    ft->last_frag_time = p->pkth->ts.tv_sec;
    ft->frag_pkts++;
    ft->frag_bytes += p->dsize;

    newfrag = (Frag2Frag *) Frag2Alloc(ft, p->pkth->ts.tv_sec, 
            sizeof(Frag2Frag));

    newfrag->data = (u_int8_t *) Frag2Alloc(ft, p->pkth->ts.tv_sec, p->dsize);

    memcpy(newfrag->data, p->data, p->dsize);

    newfrag->offset = p->frag_offset << 3;
    newfrag->size = p->dsize;

    returned = (Frag2Frag *) ubi_sptFind(ft->fraglistPtr, 
            (ubi_btItemPtr)newfrag);

    if(returned != NULL)
    {
	if(f2data.frag2_alerts && !(p->packet_flags & PKT_FRAG_ALERTED))
	{
	    SetEvent(&event, GENERATOR_SPP_FRAG2, 
		     FRAG2_OVERLAP, 1, 0, 5, 0);
	    CallAlertFuncs(p, FRAG2_OVERLAP_STR, NULL, &event);
	    CallLogFuncs(p, FRAG2_OVERLAP_STR, NULL, &event);
	    p->packet_flags |= PKT_FRAG_ALERTED;
	}

        /* we favor old data */
        frag_mem_usage -= newfrag->size;
        free(newfrag->data);

        frag_mem_usage -= sizeof(Frag2Frag);
        free(newfrag);

        return 0;
    }

    if(ubi_sptInsert(ft->fraglistPtr, (ubi_btNodePtr)newfrag, 
                (ubi_btNodePtr)newfrag, NULL) == ubi_trFALSE)
    {
        LogMessage("InsertFrag: sptInsert failed\n");

        /* 
         * if there was a problem inserting the fragment into the fraglist
         * nuke it
         */
        frag_mem_usage -= killme->size;
        free(newfrag->data);
        frag_mem_usage -= sizeof(Frag2Frag);
        free(newfrag);
        return -1;
    }

    return 0;
}



int FragIsComplete(FragTracker *ft, CompletionData *compdata)
{
    compdata->complete = 1;

    if(ft->frag_flags & FRAG_REBUILT)
    {
	/* we probably put the frag together wrong. lets atleast tell
	   people that */
	DEBUG_WRAP(DebugMessage(DEBUG_FRAG2,
				"my frag is already rebuilt! %d\n",
				(ft->frag_flags & FRAG_OUTOFORDER)););
	compdata->outoforder = 1;
    }
    
    if((ft->frag_flags & (FRAG_GOT_FIRST|FRAG_GOT_LAST)) == 
            (FRAG_GOT_FIRST|FRAG_GOT_LAST))
    {
        next_offset = 0;

        /* traverse the frag tree and see if they're all there.... */
        (void)ubi_trTraverse(ft->fraglistPtr, CompletionTraverse, compdata);

        return compdata->complete;
    }
    else
    {
        return 0;
    }
}


void RebuildFrag(FragTracker *ft, Packet *p)
{
    u_int32_t dlt_size;
    u_int16_t iph_size;
    u_int8_t *rebuild_ptr;

    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Rebuilding pkt [0x%X:%d  0x%X:%d]\n", 
			    p->iph->ip_src.s_addr, p->sp, p->iph->ip_dst.s_addr, p->dp);
	       DebugMessage(DEBUG_FRAG2, "Calculated size: %d\n", ft->calculated_size););

    if(ft->calculated_size > 65516)
    {
        LogMessage("WARNING: Dumping oversized fragment\n");
        ZapFrag(ft);
    }
 
    /* copy the packet header from the last packet of the frag */
    memcpy(defrag_pkt->pkth, p->pkth, sizeof(SnortPktHeader));

    /* copy the packet data from the last packet of the frag */
    memcpy(defrag_pkt->pkt+SPARC_TWIDDLE, p->pkt, p->pkth->caplen);

    /* calculate how big the DLT is */
    dlt_size = ((u_int32_t)p->iph) - ((u_int32_t)p->pkt) + SPARC_TWIDDLE;

    /* calculate the IP header size from the packet data */
    iph_size = IP_HLEN(p->iph) << 2;

    /* set pointer for the IP header in the rebuilt packet */
    defrag_pkt->iph = (IPHdr *) (defrag_pkt->pkt + dlt_size);

    /* clear the packet fragment fields */ 
    defrag_pkt->iph->ip_off = 0x0000;
    defrag_pkt->frag_flag = 0;

    /* check for a bad IP header size */
    if(iph_size > 60)
    {
        iph_size = 20;
    }
    
    /* set the new packet's capture length */
    defrag_pkt->pkth->caplen = dlt_size + iph_size + ft->calculated_size;
    defrag_pkt->pkth->len = defrag_pkt->pkth->caplen;

    /* set the pointer to the beginning of the transport layer of the rebuilt
     * packet
     */
    rebuild_ptr = defrag_pkt->pkt + dlt_size + iph_size;
    f2data.frag_pad = dlt_size+iph_size;

    /* walk the fragment list and rebuild the packet */
    f2data.stop_traverse = 0;
    (void)ubi_trTraverse(ft->fraglistPtr, RebuildTraverse, rebuild_ptr);
    f2data.stop_traverse = 0;
    
    /* reset the ip header pointer */
    defrag_pkt->iph = (IPHdr *) (defrag_pkt->pkt + dlt_size);
    defrag_pkt->iph->ip_off = 0x0000;

    /* set the ip dgm length */
    defrag_pkt->iph->ip_len = 
        htons((u_short)(defrag_pkt->pkth->caplen-dlt_size));

    /* tell the rest of the system that this is a rebuilt fragment */
    defrag_pkt->packet_flags = PKT_REBUILT_FRAG;
    defrag_pkt->frag_flag = 0;
    
    defrag_pkt->iph->ip_csum = 0;
        
    /* calculate the ip checksum for the packet */
    defrag_pkt->iph->ip_csum =
        in_chksum_ip((u_int16_t *)defrag_pkt->iph, iph_size);

    pc.rebuilt_frags++;

#ifdef DEBUG
    ClearDumpBuf();
    PrintNetData(stdout, defrag_pkt->pkt, defrag_pkt->pkth->caplen);
    ClearDumpBuf();
#endif

    /* process the packet through the detection engine */
    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Processing rebuilt packet:\n"););
    ProcessPacket(NULL, defrag_pkt->pkth, defrag_pkt->pkt+SPARC_TWIDDLE);
    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Done with rebuilt packet, marking rebuilt...\n"););

    ft->frag_flags = ft->frag_flags | FRAG_REBUILT;


    /* dump the packet frags */
    /* ZapFrag(ft);

    Now always done asynchronously because of the problem of detecting
    a full out frag assault after the fact ( fragroute t4 )
    */ 
}


void Frag2DeleteFrag(FragTracker *ft)
{
    if(ft == NULL)
    {
        return;
    }
        
    (void)ubi_trKillTree(ft->fraglistPtr, KillFrag);

    frag_mem_usage -= sizeof(FragTracker);
    free(ft);
}



int PruneFragCache(FragTracker *cft, u_int32_t time, u_int32_t mustdie)
{
    FragTracker *ft;
    u_int32_t pruned = 0;
    
    if(ubi_trCount(FragRootPtr) == 0)
        return 0;

    ft = (FragTracker *) ubi_btFirst((ubi_btNodePtr)FragRootPtr);

    if(ft == NULL)
        return 0;

    if(time)
    {
        do
        {
            if((ft->frag_flags & FRAG_REBUILT) ||
	       ft->last_frag_time + f2data.frag_timeout < time)
            {
                FragTracker *savft = ft;

                ft = (FragTracker *) ubi_btNext((ubi_btNodePtr)ft);

                if ((int)savft != (int)cft && ubi_trCount(FragRootPtr) > 1)
                {
                    DEBUG_WRAP(DebugMessage(DEBUG_FRAG2, "Pruning stale fragment\n"););
                    ZapFrag(savft);
                    pc.frag_timeout++;
                    pruned++;
                }
            }
            else
            {
		if(ft !=NULL && ubi_trCount(FragRootPtr)) {
		    ft = (FragTracker *) ubi_btNext((ubi_btNodePtr)ft);		    
		} else {
		    return pruned;
		}
            }
        } while(ft != NULL);

        return pruned;
    }
    else
    {
	/* Make sure we don't free the root. */
	while(mustdie-- && ubi_trCount(FragRootPtr) > 1)
        {
	    /* 
	     * this code pulls a random leaf node from the frag tree for
	     * deletion, allowing us to unpredicatably zap nodes which are
	     * pretty stale anyway
	     */
	    ft = (FragTracker *) ubi_btLeafNode((ubi_btNodePtr) FragRootPtr);
            if((int)ft != (int)cft)
            {
                ZapFrag(ft);
                pc.frag_incomp++;
            }
        }

        return mustdie;
    }

    return 0;
}



void ZapFrag(FragTracker *ft)
{
    FragTracker *killme;
    
    if(ft != NULL && FragRootPtr->count != 0)
    {
        killme = (FragTracker *) ubi_sptRemove(FragRootPtr, 
                (ubi_btNodePtr) ft);

        Frag2DeleteFrag(killme);
    }
}



void Frag2Restart(int signal, void *foo)
{
    return;
}



void Frag2CleanExit(int signal, void *foo)
{
    return;
}



void Frag2InitPkt()
{
    defrag_pkt->pkth =  calloc(sizeof(SnortPktHeader), 
            sizeof(char));

    defrag_pkt->pkt = (u_int8_t *) calloc(
            ETHERNET_HEADER_LEN+65536+SPARC_TWIDDLE, sizeof(char));
}
