/* $Id: sp_ip_proto.c,v 1.9 2002/05/13 20:14:06 chrisgreen Exp $ */

/* sp_ip_proto 
 * 
 * Purpose:
 *
 * Check the IP header's protocol field value.
 *
 * Arguments:
 *   
 *   Number, protocol name, ! for negation
 *
 * Effect:
 *
 *  Success on protocol match, failure otherwise 
 *
 * Comments:
 *
 * None.
 *
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <sys/types.h>
#include <stdlib.h>
#include <ctype.h>
#ifndef WIN32
#include <netdb.h>
#endif /* !WIN32 */

#include "rules.h"
#include "decode.h"
#include "plugbase.h"
#include "parser.h"
#include "debug.h"
#include "util.h"
#include "plugin_enum.h"

extern char *file_name;  /* this is the file name from rules.c, generally used
                            for error messages */

extern int file_line;    /* this is the file line number from rules.c that is
                            used to indicate file lines for error messages */

#define GREATER_THAN            1
#define LESS_THAN               2

typedef struct _IpProtoData
{
    u_int8_t protocol;
    u_int8_t not_flag;
    u_int8_t comparison_flag;

} IpProtoData;

void IpProtoInit(char *, OptTreeNode *, int);
void IpProtoRuleParseFunction(char *, OptTreeNode *);
int IpProtoDetectorFunction(Packet *, struct _OptTreeNode *, OptFpList *);



/****************************************************************************
 * 
 * Function: SetupIpProto()
 *
 * Purpose: Generic detection engine plugin ip_proto.  Registers the
 *          configuration function and links it to a rule keyword.  This is
 *          the function that gets called from InitPlugins in plugbase.c.
 *
 * Arguments: None.
 *
 * Returns: void function
 *
 ****************************************************************************/
void SetupIpProto()
{
    /* map the keyword to an initialization/processing function */
    RegisterPlugin("ip_proto", IpProtoInit);
    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN,"Plugin: IpProto Setup\n"););
}


/****************************************************************************
 * 
 * Function: IpProtoInit(char *, OptTreeNode *)
 *
 * Purpose: Generic rule configuration function.  Handles parsing the rule 
 *          information and attaching the associated detection function to
 *          the OTN.
 *
 * Arguments: data => rule arguments/data
 *            otn => pointer to the current rule option list node
 *
 * Returns: void function
 *
 ****************************************************************************/
void IpProtoInit(char *data, OptTreeNode *otn, int protocol)
{
    /* allocate the data structure and attach it to the
       rule's data struct list */
    otn->ds_list[PLUGIN_IP_PROTO_CHECK] = (IpProtoData *) calloc(sizeof(IpProtoData), sizeof(char));

    /* this is where the keyword arguments are processed and placed into the 
       rule option's data structure */
    IpProtoRuleParseFunction(data, otn);

    /* finally, attach the option's detection function to the rule's 
       detect function pointer list */
    AddOptFuncToList(IpProtoDetectorFunction, otn);
}



/****************************************************************************
 * 
 * Function: IpProtoRuleParseFunction(char *, OptTreeNode *)
 *
 * Purpose: This is the function that is used to process the option keyword's
 *          arguments and attach them to the rule's data structures.
 *
 * Arguments: data => argument data
 *            otn => pointer to the current rule's OTN
 *
 * Returns: void function
 *
 ****************************************************************************/
void IpProtoRuleParseFunction(char *data, OptTreeNode *otn)
{
    IpProtoData *ds_ptr;  /* data struct pointer */
    struct protoent *pt;

    /* set the ds pointer to make it easier to reference the option's
       particular data struct */
    ds_ptr = otn->ds_list[PLUGIN_IP_PROTO_CHECK];

    while(isspace((int)*data)) data++;

    if(*data == '!')
    {
        ds_ptr->not_flag = 1;
        data++;
    }

    if(*data == '>')
    {
        ds_ptr->comparison_flag = GREATER_THAN; 
        data++;
    }

    if(*data == '<')
    {
        ds_ptr->comparison_flag = LESS_THAN; 
        data++;
    }

    /* check for a number or a protocol name */
    if(isdigit((int)*data))
    {
        ds_ptr->protocol = atoi(data);
    }
    else
    {
        pt = getprotobyname(data);

        if(pt)
        {
            ds_ptr->protocol = (u_char) pt->p_proto;
        }
        else
        {
            FatalError("ERROR %s(%d) => Bad protocol name \"%s\"\n", file_name, file_line, data);
        }
    } 
}


/****************************************************************************
 * 
 * Function: IpProtoDetectorFunction(char *, OptTreeNode *)
 *
 * Purpose: Use this function to perform the particular detection routine
 *          that this rule keyword is supposed to encompass.
 *
 * Arguments: data => argument data
 *            otn => pointer to the current rule's OTN
 *
 * Returns: If the detection test fails, this function *must* return a zero!
 *          On success, it calls the next function in the detection list 
 *
 ****************************************************************************/
int IpProtoDetectorFunction(Packet *p, struct _OptTreeNode *otn, OptFpList *fp_list)
{
    IpProtoData *ipd;  /* data struct pointer */

    ipd = otn->ds_list[PLUGIN_IP_PROTO_CHECK];

    if(!ipd->comparison_flag)
    {
        if((ipd->protocol == p->iph->ip_proto) ^ ipd->not_flag)
        {
            return fp_list->next->OptTestFunc(p, otn, fp_list->next);
        }
        else
        {
            /* you can put debug comments here or not */
            DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN,"No match\n"););
        }
    }
    else
    {
        if(ipd->comparison_flag == GREATER_THAN)
        {
            if(p->iph->ip_proto > ipd->protocol)
            {
                return fp_list->next->OptTestFunc(p, otn, fp_list->next);
            }
        }
        else
        {
            if(p->iph->ip_proto < ipd->protocol)
            {
                return fp_list->next->OptTestFunc(p, otn, fp_list->next);
            }
        }
    }
    
    /* if the test isn't successful, this function *must* return 0 */
    return 0;
}
