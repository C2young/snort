#ifdef USE_SF_STATS

/* $Id: spp_perfmonitor.c,v 1.1 2002/08/07 21:20:41 chrisgreen Exp $ 
**
**  spp_perfmonitor.c
**
**  Copyright (C) 2002 Sourcefire, Inc.
**  Marc Norton
**  Dan Roelker
**
**  NOTES
**  6.4.02 - Initial Source Code.  Norton/Roelker
**
**  This program is free software; you can redistribute it and/or modify
**  it under the terms of the GNU General Public License as published by
**  the Free Software Foundation; either version 2 of the License, or
**  (at your option) any later version.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
**  GNU General Public License for more details.
**
**  You should have received a copy of the GNU General Public License
**  along with this program; if not, write to the Free Software
**  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
**
*/

#include <stdlib.h>
#include <ctype.h>
#include "plugbase.h"
#include "mstring.h"
#include "util.h"
#include "debug.h"

#include "snort.h"
#include "perf.h"

/* external globals from rules.c */
extern char *file_name;
extern int   file_line;

/*
*  Protype these forward references, and don't clutter up the name space
*/
static void PerfMonitorInit(u_char *args);
static void ParsePerfMonitorArgs(char *args);
static void ProcessPerfMonitor(Packet *p);

/*
 * Function: SetupPerfMonitor()
 *
 * Purpose: Registers the preprocessor keyword and initialization 
 *          function into the preprocessor list.  This is the function that
 *          gets called from InitPreprocessors() in plugbase.c.
 *
 * Arguments: None.
 *
 * Returns: void function
 *
 */
void SetupPerfMonitor()
{
    /* link the preprocessor keyword to the init function in 
       the preproc list */
    RegisterPreprocessor("perfmonitor", PerfMonitorInit);

    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN,"Preprocessor: PerfMonitor is setup...\n"););
}

/*
 * Function: PerfMonitorInit(u_char *)
 *
 * Purpose: Calls the argument parsing function, performs final setup on data
 *          structs, links the preproc function into the function list.
 *
 * Arguments: args => ptr to argument string
 *
 * Returns: void function
 *
 */
static void PerfMonitorInit(u_char *args)
{
    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN,"Preprocessor: PerfMonitor Initialized\n"););

    /* parse the argument list from the rules file */
    ParsePerfMonitorArgs(args);

    /* Set the preprocessor function into the function list */
    AddFuncToPreprocList(ProcessPerfMonitor);
}


static int VerifyNumber(char *num)
{
    int iCtr;

    for(iCtr = 0; iCtr < strlen(num); iCtr++)
    {
        if(!isdigit(num[iCtr]))
        {
            return 1;
        }
    }

    /*
    **  Check to make sure that the number is not zero.
    */
    if(atoi(num) == 0)
    {
        return 0;
    }

    return 0;
}

/*
 * Function: ParsePerfMonitorArgs(char *)
 *
 * Purpose: Process the preprocessor arguements from the rules file and 
 *          initialize the preprocessor's data struct.  This function doesn't
 *          have to exist if it makes sense to parse the args in the init 
 *          function.
 *
 * Arguments: args => argument list
 *
 *
 *  perfmonitor: [ time 10 flow ]
 *
 * Returns: void function
 *
 */
static void ParsePerfMonitorArgs(char *args)
{
    char **Tokens=0;
    int   iTokenNum=0;
    int   i, iTime=60, iFlow=0, iEvents=0;
    int   iFile=0, iConsole=0,iPkts=0;
    char  file[1024];

    if( args )
    {
       Tokens = mSplit(args, " \t", 10, &iTokenNum, '\\');
    }
    
    for( i = 0; i < iTokenNum; i++ )
    {
        /* Check for a 'time number' parameter */
        if( strcmp( Tokens[i],"time")==0 )
        {
            /* make sure we have at least one more argument */
            if( i == (iTokenNum-1) )
            {
                FatalError("%s(%d) => Missing Time  The value must be a "
                           "positive integer number.\n", file_name, file_line);
            }
            /* Verify we have a number for seconds */
            if(VerifyNumber(Tokens[i+1]))
            {
                FatalError("%s(%d) => Invalid Time  The value must be a "
                           "positive integer number.\n", file_name, file_line);
            }
	        /* Grab the seconds */
            iTime =  atoi(Tokens[i+1]);
	 
            i++;
        }
        else if( strcmp( Tokens[i],"flow")==0 )
        {
            /*
            **  This parameter turns on the flow statistics.
            **  Flow statistics give you the traffic profile
            **  that snort is processing.  This helps in
            **  troubleshooting and performance tuning.
            */
            iFlow = 1;
        }       
        else if( strcmp( Tokens[i],"events")==0 )
        {
            /*
            **  The events paramenter gives the total number
            **  of qualified and non-qualified events during
            **  the processing sample time.  This allows 
            **  performance problems to be seen in a general
            **  manner.
            */
            iEvents = 1;
        }
        else if(!strcmp(Tokens[i], "console"))
        {
            iConsole = 1;
        }
        else if(!strcmp(Tokens[i], "file"))
        {
            iFile = 1;
	    strncpy( file, Tokens[++i], sizeof(file) );
        }
        else if(!strcmp(Tokens[i], "pktcnt"))
        {
            iPkts = atoi(Tokens[++i]);
	    if( iPkts < 0 ) iPkts = 1000;
	    printf("Pkt-Cnt Set to %d\n\n",iPkts);
        }
        else
        {
            FatalError("y%s(%d)=> Invalid parameter '%s' to preprocessor"
                       " PerfMonitor.\n", Tokens[i], file_name, file_line);
        }
    }

    /*
    *  Initialize the performance system and set flags
    */
    sfInitPerformanceStatistics(&sfPerf);
     
    sfSetPerformanceSampleTime( &sfPerf, iTime );

    sfSetPerformanceStatistics( &sfPerf, SFPERF_BASE );
    
    if( iFlow  ) sfSetPerformanceStatistics( &sfPerf, SFPERF_FLOW );
    
    if( iEvents) sfSetPerformanceStatistics( &sfPerf, SFPERF_EVENT );

    if( iConsole ) sfSetPerformanceStatistics( &sfPerf, SFPERF_CONSOLE );
    
    if( iFile ) sfSetPerformanceStatisticsEx( &sfPerf, SFPERF_FILE, file );
    
    if( iPkts ) sfSetPerformanceStatisticsEx( &sfPerf, SFPERF_PKTCNT, &iPkts );
    
    return;
}


/*
 * Function: ProcessPerfMonitor(Packet *)
 *
 * Purpose: Perform the preprocessor's intended function.  This can be
 *          simple (statistics collection) or complex (IP defragmentation)
 *          as you like.  Try not to destroy the performance of the whole
 *          system by trying to do too much....
 *
 * Arguments: p => pointer to the current packet data struct 
 *
 * Returns: void function
 *
 */
static void ProcessPerfMonitor(Packet *p)
{
    if(sfPerf.sample_interval > 0)
    {
        if(p->pkth)
        {
            sfPerformanceStats(&sfPerf, p->pkt, p->pkth->caplen, 
                               p->packet_flags & PKT_REBUILT_STREAM);
        }
    }

    /* this is the number of raw syns... */
    if( p->tcph )
      if( (p->tcph->th_flags & TH_SYN) && !(p->tcph->th_flags & TH_ACK ) )
           sfPerf.sfBase.iConnects++;

    /*
    *  TCP Flow Perf
    */
    if(sfPerf.iPerfFlags & SFPERF_FLOW)
    {
        if( p->tcph )
	{
            UpdateTCPFlowStatsEx(p->sp, p->dp, p->pkth->caplen);
	}
	
        /*
        *  UDP Flow Stats
        */
        else if( p->udph )
            UpdateUDPFlowStatsEx(p->sp, p->dp, p->pkth->caplen);

        /*
        *  Get stats for ICMP packets
        */
        else if( p->icmph )
            UpdateICMPFlowStatsEx(p->icmph->type, p->pkth->caplen);
    }

    return;
}

#endif /* USE_SF_STATS */
