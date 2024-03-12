/*
** Copyright (C) 2002 Andrew R. Baker <andrewb@snort.org>
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
/* spp_asn1
 * 
 * Purpose:
 *
 * Arguments:
 *   
 * Effect:
 *
 * Comments:
 *
 */
#include "spp_asn1.h"
#include "generators.h"
#include "plugbase.h"
#include "parser.h"
#include "util.h"
#include "detect.h"
#include "log.h"
#include "debug.h"
#include <ctype.h>

#define MODNAME "spp_asn1"

extern char *file_name;
extern int file_line;

int ASN1Decode(Packet *, u_int8_t *data, u_int16_t size);

/* Instantiate the list of ports we're going to watch */

/*
 * Function: SetupASN1Decode()
 *
 * Purpose: Registers the preprocessor keyword and initialization 
 *          function into the preprocessor list.
 *
 * Arguments: None.
 *
 * Returns: void function
 *
 */
void SetupASN1Decode()
{
    /* link the preprocessor keyword to the init function in 
       the preproc list */
    RegisterPreprocessor("asn1_decode", ASN1DecodeInit);
}


/*
 * Function: ASN1DecodeInit(u_char *)
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
void ASN1DecodeInit(u_char *args)
{
    /* Set the preprocessor function into the function list */
    AddFuncToPreprocList(PreprocASN1Decode);
}

/*
 * Function: PreprocASN1Decode(Packet *)
 *
 * Arguments: p => pointer to the current packet data struct 
 *
 * Returns: void function
 *
 */
void PreprocASN1Decode(Packet *p)
{
    if(p->frag_flag)
        return;

    if(!PacketIsUDP(p))
    {
        DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, "It isn't UDP traffic\n"););
        return;
    }

    if(p->dp == 161 || p->dp == 162)
    {
        ASN1Decode(p, p->data, p->dsize);    
    }
}

int ASN1Decode(Packet *p, u_int8_t *data, u_int16_t size)
{
    int i;
    int id;
    int length;
    Event event;
    
    for(i = 0; i < size; )
    {
        /* decode the identifier */
        if((data[i] & 0x1f) == 0x1f)
        {
            if(pv.verbose_flag)
            {
                ErrorMessage("Multibyte ASN.1 identifier, bailing out");
            }

            return 0;
        }
        
        id = data[i];
        ++i;
        
        /* decode the length */
        if(data[i] == 0x80)
        {
            SetEvent(&event, 
                    GENERATOR_SPP_ASN1, 
                    ASN1_INDEFINITE_LENGTH, 
                    1, 0, 5, 0);

            CallAlertFuncs(p, ASN1_INDEFINITE_LENGTH_STR, 
			   NULL, &event);

            CallLogFuncs(p, ASN1_INDEFINITE_LENGTH_STR,
			 NULL, &event);

            return 1;
        }
        else if(data[i] == 0xff)
        {
            SetEvent(&event, GENERATOR_SPP_ASN1, ASN1_INVALID_LENGTH, 
		     1, 0, 5, 0);

            CallAlertFuncs(p, ASN1_INVALID_LENGTH_STR, NULL, &event);

            CallLogFuncs(p,ASN1_INVALID_LENGTH_STR,
			 NULL, &event);

            return 1;
        }
        else
        {
            if(data[i] > 0x80)
            {
                int len_octets = data[i] & 0x7f;
                ++i;
                if(len_octets + i > size)
                {
                    SetEvent(&event, GENERATOR_SPP_ASN1, ASN1_OVERSIZED_ITEM, 
			     1, 0, 5, 0);

                    CallAlertFuncs(p, ASN1_OVERSIZED_ITEM_STR,
				   NULL, &event);

                    CallLogFuncs(p, ASN1_OVERSIZED_ITEM_STR,
				 NULL, &event);

                    return 1;
                }
                if(len_octets > 2)
                {
                    SetEvent(&event, GENERATOR_SPP_ASN1, ASN1_SPEC_VIOLATION, 
			     1, 0, 5, 0);

                    CallAlertFuncs(p, ASN1_SPEC_VIOLATION_STR,
				   NULL, &event);

                    CallLogFuncs(p, ASN1_SPEC_VIOLATION_STR,
				 NULL, &event);

                    return 1;
                }

                length = (data[i] << 8 | data[i + 1]);
                i += 2;
            }
            else
           { 
                length = data[i];
                ++i;
           } 
            
            if((length + i) > size)
            {
                SetEvent(&event, GENERATOR_SPP_ASN1, ASN1_DATUM_BAD_LENGTH, 
                        1, 0, 5, 0);

                CallAlertFuncs(p,ASN1_DATUM_BAD_LENGTH_STR, NULL, &event);

                CallLogFuncs(p,  ASN1_DATUM_BAD_LENGTH_STR, NULL, &event);
            }

            /* recursively parse constructed types */
            if((id & 0x20) == 0x20)
            {
                if(ASN1Decode(p, data + i, length))
                    return 1;
            }
            
            i += length;
        }
    }

    return 0;
}
