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

/* $Id: */
/* spp_rpc_decode 
 * 
 * Purpose:
 *
 * This preprocessor normalizes the RPC requests from remote machines by
 * converting all fragments into one continous stream.
 * This is very useful for doing things like defeating hostile attackers
 * trying to stealth themselves from IDSs by fragmenting the request so the
 * string 0186A0 is broken up.
 *
 * Arguments:
 *   
 * This plugin takes a list of integers representing the TCP ports that the
 * user is interested in having normalized
 *
 * Effect:
 *
 * Changes the data in the packet payload and changes
 * p->dsize to reflect the new (smaller) payload size.
 *
 * Comments:
 *
 */
#include <sys/types.h>
#include <stdlib.h>
#include <ctype.h>

#include "decode.h"
#include "plugbase.h"
#include "parser.h"
#include "log.h"
#include "debug.h"
#include "util.h"
#include "mstring.h"
#include "snort.h"

#define MODNAME "spp_rpc_decode"

extern char *file_name;
extern int file_line;

void RpcDecodeInit(u_char *);
void RpcDecodeInitIgnore(u_char *);
void PreprocRpcDecode(Packet *);
void SetRpcPorts(char *);
void ConvertRPC(u_int8_t *, u_int16_t);

/* array containing info about which ports we care about */
static char RpcDecodePorts[65536/8];


/*
 * Function: SetupRpcDecode()
 *
 * Purpose: Registers the preprocessor keyword and initialization 
 *          function into the preprocessor list.
 *
 * Arguments: None.
 *
 * Returns: void function
 *
 */
void SetupRpcDecode()
{
    /* link the preprocessor keyword to the init function in 
       the preproc list */
    RegisterPreprocessor("rpc_decode", RpcDecodeInit);

    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN,"Preprocessor: RpcDecode in setup...\n"););
}


/*
 * Function: RpcDecodeInit(u_char *)
 *
 * Purpose: Processes the args sent to the preprocessor, sets up the
 *          port list, links the processing function into the preproc
 *          function list
 *
 * Arguments: args => ptr to argument string
 *
 * Returns: void function
 *
 */
void RpcDecodeInit(u_char *args)
{
    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN,"Preprocessor: RpcDecode Initialized\n"););

    /* parse the argument list into a list of ports to normalize */
    SetRpcPorts(args);

    /* Set the preprocessor function into the function list */
    AddFuncToPreprocList(PreprocRpcDecode);
}

/*
 * Function: SetRpcPorts(char *)
 *
 * Purpose: Reads the list of port numbers from the argument string and
 *          parses them into the port list data struct
 *
 * Arguments: portlist => argument list
 *
 * Returns: void function
 *
 */
void SetRpcPorts(char *portlist)
{
    char portstr[STD_BUF];
    char **toks;
    int is_reset = 0;
    int num_toks;
    int num;

    if(portlist == NULL || *portlist == '\0')
    {
        portlist = "111 32771";
    }

    /* tokenize the argument list */
    toks = mSplit(portlist, " ", 31, &num_toks, '\\');

    LogMessage("rpc_decode arguments:\n");

    /* convert the tokens and place them into the port list */
    for(num = 0; num < num_toks; num++)
    {
        if(isdigit((int)toks[num][0]))
        {
            char *num_p = NULL; /* used to determine last position in string */
            long t_num;

            t_num = strtol(toks[num], &num_p, 10);

            if(*num_p != '\0')
            {
                FatalError("ERROR %s(%d) => Port Number invalid format: %s\n",
                           file_name, file_line, toks[num]);
            }
            else if(t_num < 0 || t_num > 65535)
            {
	        FatalError("ERROR %s(%d) => Port Number out of range: %ld\n",
                           file_name, file_line, t_num);
            }

            /* user specified a legal port number and it should override the default
               port list, so reset it unless already done */
            if(!is_reset)
            {
                bzero(&RpcDecodePorts, sizeof(RpcDecodePorts));
                portstr[0] = '\0';
                is_reset = 1;
            }

            /* mark this port as being interesting using some portscan2-type voodoo,
               and also add it to the port list string while we're at it so we can
               later print out all the ports with a single LogMessage() */
            RpcDecodePorts[(t_num/8)] |= 1<<(t_num%8);
            strlcat(portstr, toks[num], STD_BUF - 1);
            strlcat(portstr, " ", STD_BUF - 1);
        }
        else
        {
            FatalError("ERROR %s(%d) => Unknown argument to rpc_decode "
                       "preprocessor: \"%s\"\n",
                       file_name, file_line, toks[num]);
        }
    }

    /* print out final port list */
    LogMessage("    Ports to decode RPC on: %s\n", portstr);
}                                                                               
   

/*
 * Function: PreprocRpcDecode(Packet *)
 *
 * Purpose: Inspects the packet's payload for fragment records and 
 *          converts them into one infragmented record.
 *
 * Arguments: p => pointer to the current packet data struct 
 *
 * Returns: void function
 *
 */
void PreprocRpcDecode(Packet *p)
{
    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN,"rpc decoder init on %d bytes\n", p->dsize););

    /* check to make sure we're talking TCP and that the TWH has already
       completed before processing anything */
    if(!PacketIsTCP(p))
    {
        DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN,"It isn't TCP session traffic\n"););
        return;
    }

    /* check the port list */
    if(!(RpcDecodePorts[(p->dp/8)] & (1<<(p->dp%8))))
    {
        return;
    }

    ConvertRPC(p->data, p->dsize);
}


void ConvertRPC(u_int8_t *data, u_int16_t size)
{
    u_int8_t *rpc;       /* this is where the converted data will be written */
    u_int8_t *tmpptr;    /* this is where the converted data will be written */
    u_int8_t *index;     /* this is the index pointer to walk thru the data */
    u_int8_t *end;       /* points to the end of the payload for loop control */
    u_int16_t psize;     /* payload size */
    int i = 0;           /* loop counter */
    int length;          /* this is to store 32 bits of the data  */
    int total_len = 0;   /* this is to store 32 bits of the data  */
    u_int32_t *hdrptr;   /* points to 4 byte header...easier to grab this way */


    /* on match, normalize the data */
    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, "Got RPC traffic (%d bytes)!\n", size););

    /* setup the pointers */
    hdrptr = (u_int32_t *)  data;
    rpc =   (u_int8_t *)    data;
    index = (u_int8_t *)    data;
    end =   (u_int8_t *)    data + size;
    psize = (u_int16_t)     size;

#ifndef WORDS_BIGENDIAN
    if(((int)(htonl(*hdrptr) & 0x80000000) >> 31) == 1)
#else
        if(((int)(*hdrptr & 0x80000000) >> 31) == 1)
#endif
        {
            return;
        }

    /* check to make sure we've got enough data */
    if(size < 16)
        return;

    /* now we know it's in fragmented records, 4 bytes of 
     * header(of which the most sig bit fragment (0=yes 1=no). 
     * The header is followed by the value move pointer up 4 
     * bytes, we need to stuff header in first 4 bytes.  
     * But the header has the total length...we don't know 
     * until the end 
     */
    tmpptr = rpc;
    rpc += 4;    

    while(index < end)
    {
        /* get the fragment length (31 bits) and move the pointer to the
           start of the actual data */
        hdrptr = (int *) index;

#ifndef WORDS_BIGENDIAN
        length = (int)(htonl(*hdrptr) & 0x7FFFFFFF);
#else
        length = (int)(*hdrptr & 0x7FFFFFFF);
#endif
        if(length > size)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_FLOW, "WARNING: rpc_decode calculated bad "
                        "length: %d\n", length););
            return;
        }
        else
        {
            total_len += length;
            index += 4;
            for (i=0; i < length; i++,rpc++,index++,hdrptr++)
                *rpc = *index;
        }
    }

    /* point to beginning again  */
    rpc = tmpptr;        

    /* we need to add header to first 4 bytes  */
    *rpc++ = (char) 0x80;
    *rpc++ = (char) 0x0;
    *rpc++ = (char) 0x0;
    *rpc = total_len;

    /* set the payload size to reflect the new size */ 
    size = 4+total_len;

    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, "New size: %d\n", size);
            DebugMessage(DEBUG_PLUGIN, "converted data:\n");
            PrintNetData(stdout, data, size););
    return;
}

