/*
** Copyright (C) 1998-2002 Martin Roesch <roesch@sourcefire.com>
** Copyright (C) 2000,2001 Andrew R. Baker <andrewb@uab.edu>
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

/* spo_alert_unixsock
 * 
 * Purpose:  output plugin for Unix Socket alerting
 *
 * Arguments:  none (yet)
 *   
 * Effect:	???
 *
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <sys/types.h>
#include <string.h>
#ifndef WIN32
#include <sys/un.h>
#endif /* !WIN32 */
#include <unistd.h>
#include <errno.h>

#include "event.h"
#include "decode.h"
#include "plugbase.h"
#include "parser.h"
#include "debug.h"
#include "util.h"

#include "snort.h"

#ifndef WIN32
#define UNSOCK_FILE "/dev/snort_alert"
#else
#define UNSOCK_FILE "snort_alert"
#endif



/*
 * Win32 does not support Unix sockets (sockaddr_un).  This file
 * will not be compiled on Win32 until a proper patch is supported.
 */
#ifndef WIN32




/* not used yet */
typedef struct _SpoAlertUnixSockData
{
    char *filename;

} SpoAlertUnixSockData;

/* this struct is for the alert socket code.... */
typedef struct _Alertpkt
{
    u_int8_t alertmsg[ALERTMSG_LENGTH]; /* variable.. */
    struct pcap_pkthdr pkth;
    u_int32_t dlthdr;       /* datalink header offset. (ethernet, etc.. ) */
    u_int32_t nethdr;       /* network header offset. (ip etc...) */
    u_int32_t transhdr;     /* transport header offset (tcp/udp/icmp ..) */
    u_int32_t data;
    u_int32_t val;  /* which fields are valid. (NULL could be
                     * valids also) 
                     *                                  */
    /* Packet struct --> was null */
#define NOPACKET_STRUCT 0x1
    /* no transport headers in packet */
#define NO_TRANSHDR    0x2
    u_int8_t pkt[SNAPLEN];
    Event event;
} Alertpkt;

static int alertsd;
#ifndef WIN32
struct sockaddr_un alertaddr;
#else
struct sockaddr_in alertaddr;
#endif

void AlertUnixSockInit(u_char *);
void AlertUnixSock(Packet *, char *, void *, Event *);
void ParseAlertUnixSockArgs(char *);
//void AlertUnixSockCleanExit(int, void *);
//void AlertUnixSockRestart(int, void *);
void OpenAlertSock();


/* external globals from rules.c */
extern char *file_name;
extern int file_line;

/*
 * Function: SetupAlertUnixSock()
 *
 * Purpose: Registers the output plugin keyword and initialization 
 *          function into the output plugin list.  This is the function that
 *          gets called from InitOutputPlugins() in plugbase.c.
 *
 * Arguments: None.
 *
 * Returns: void function
 *
 */
void AlertUnixSockSetup()
{
    /* link the preprocessor keyword to the init function in 
       the preproc list */
    RegisterOutputPlugin("alert_unixsock", NT_OUTPUT_ALERT, AlertUnixSockInit);
    DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Output plugin: AlertUnixSock is setup...\n"););
}


/*
 * Function: AlertUnixSockInit(u_char *)
 *
 * Purpose: Calls the argument parsing function, performs final setup on data
 *          structs, links the preproc function into the function list.
 *
 * Arguments: args => ptr to argument string
 *
 * Returns: void function
 *
 */
void AlertUnixSockInit(u_char *args)
{
    DEBUG_WRAP(DebugMessage(DEBUG_INIT,"Output: AlertUnixSock Initialized\n"););

    pv.alert_plugin_active = 1;

    /* parse the argument list from the rules file */
    ParseAlertUnixSockArgs(args);

    DEBUG_WRAP(DebugMessage(DEBUG_INIT,"Linking UnixSockAlert functions to call lists...\n"););

    /* Set the preprocessor function into the function list */
    AddFuncToOutputList(AlertUnixSock, NT_OUTPUT_ALERT, NULL);
}


/*
 * Function: ParseAlertUnixSockArgs(char *)
 *
 * Purpose: Process the preprocessor arguements from the rules file and 
 *          initialize the preprocessor's data struct.  This function doesn't
 *          have to exist if it makes sense to parse the args in the init 
 *          function.
 *
 * Arguments: args => argument list
 *
 * Returns: void function
 */
void ParseAlertUnixSockArgs(char *args)
{
    DEBUG_WRAP(DebugMessage(DEBUG_LOG,"ParseAlertUnixSockArgs: %s\n", args););
    /* eventually we may support more than one socket */
    OpenAlertSock();
}

/****************************************************************************
 *
 * Function: SpoUnixSockAlert(Packet *, char *)
 *
 * Arguments: p => pointer to the packet data struct
 *            msg => the message to print in the alert
 *
 * Returns: void function
 *
 ***************************************************************************/
void AlertUnixSock(Packet *p, char *msg, void *arg, Event *event)
{
    static Alertpkt alertpkt;

    DEBUG_WRAP(DebugMessage(DEBUG_LOG, "Logging Alert data!\n"););

    bzero((char *)&alertpkt,sizeof(alertpkt));
    if (event)
    {
        bcopy((const void *)event,(void *)&alertpkt.event,sizeof(Event));
    }

    if(p && p->pkt)
    {
        bcopy((const void *)p->pkth,(void *)&alertpkt.pkth,sizeof(struct pcap_pkthdr));
        bcopy((const void *)p->pkt,alertpkt.pkt,
              alertpkt.pkth.caplen > SNAPLEN? SNAPLEN : alertpkt.pkth.caplen);
    }
    else
        alertpkt.val|=NOPACKET_STRUCT;

    if (msg)
    {
        bcopy((const void *)msg,(void *)alertpkt.alertmsg,
               strlen(msg)>ALERTMSG_LENGTH-1 ? ALERTMSG_LENGTH - 1 : strlen(msg));
    }

    /* some data which will help monitoring utility to dissect packet */
    if(!(alertpkt.val & NOPACKET_STRUCT))
    {
	if(p)
	{
	    if (p->eh) {
		alertpkt.dlthdr=(char *)p->eh-(char *)p->pkt;
	    }
	    
	    /* we don't log any headers besides eth yet */
	    if (p->iph && p->pkt) {
		alertpkt.nethdr=(char *)p->iph-(char *)p->pkt;
		
		switch(p->iph->ip_proto)
		{
		case IPPROTO_TCP:
		    if (p->tcph) alertpkt.transhdr=(char *)p->tcph-(char *)p->pkt;
		    break;
		    
		case IPPROTO_UDP:
		    if (p->udph) alertpkt.transhdr=(char *)p->udph-(char *)p->pkt;
		    break;
		    
		case IPPROTO_ICMP:
		    if (p->icmph) alertpkt.transhdr=(char *)p->icmph-(char *)p->pkt;
		    break;
		    
		default:
		    /* alertpkt.transhdr is null due to initial bzero */
                alertpkt.val|=NO_TRANSHDR;
		}
	    }

	    if (p->data && p->pkt) alertpkt.data=p->data - p->pkt;
	}
    }


    if(sendto(alertsd,(const void *)&alertpkt,sizeof(Alertpkt),
              0,(struct sockaddr *)&alertaddr,sizeof(alertaddr))==-1)
    {
        /* whatever we do to sign that some alerts could be missed */
    }


}



/*
 * Function: OpenAlertSock
 *
 * Purpose:  Connect to UNIX socket for alert logging..
 *
 * Arguments: none..
 *
 * Returns: void function
 */
void OpenAlertSock()
{
    char *srv = UNSOCK_FILE;

    if(access(srv, W_OK))
    {
       ErrorMessage("WARNING: %s file doesn't exist or isn't writable!\n",
            srv);
    }

    bzero((char *) &alertaddr, sizeof(alertaddr));

    /* we trust what we define */
    bcopy((const void *) srv, (void *) alertaddr.sun_path, strlen(srv));

    alertaddr.sun_family = AF_UNIX;

    if((alertsd = socket(AF_UNIX, SOCK_DGRAM, 0)) < 0)
    {
        FatalError("socket() call failed: %s", strerror(errno));
    }
}

#endif /* !WIN32 */

