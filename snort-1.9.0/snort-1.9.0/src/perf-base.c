#ifdef USE_SF_STATS
/*
** $Id: perf-base.c,v 1.3 2002/10/02 01:55:05 chrisgreen Exp $
**
** perf-base.c
**
** Copyright (C) 2002 Sourcefire,Inc
** Dan Roelker
** Marc Norton
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

#include <time.h>
#ifndef WIN32
#include <sys/time.h>
#include <sys/resource.h>
#endif /* WIN32 */
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <string.h>

#include "snort.h"
#include "util.h"

#define ACCUMULATE_PKTS

int GetPktDropStats(SFBASE *sfBase, SFBASE_STATS *sfBaseStats);
int DisplayBasePerfStatsConsole(SFBASE_STATS *sfBaseStats, int iFlags);
int CalculateBasePerfStats(SFBASE *sfPerf, SFBASE_STATS *sfBaseStats);
int LogBasePerfStats(SFBASE_STATS *sfBaseStats,  FILE * fh );

/*
**  NAME
**    InitBaseStats
**  DESCRIPTION
**    Initializes structs and variables for the next performance
**    sample.
**
**  FORMAL INPUTS
**    SFBASE * -- pointer to structure to initialize
** 
**  FORMAL OUTPUTS
**    int -- 0 is successful
*/ 
int InitBaseStats(SFBASE *sfBase)
{
    struct timeval tvTime;
    struct rusage  rusage;


#ifndef WIN32 
    if(getrusage(RUSAGE_SELF, &rusage) >= 0)
    {
        sfBase->usertime_sec   = (double)rusage.ru_utime.tv_sec +
            ((double)rusage.ru_utime.tv_usec * 1.0e-6);
        sfBase->systemtime_sec = (double)rusage.ru_stime.tv_sec +
            ((double)rusage.ru_stime.tv_usec * 1.0e-6);
    }
    else
    {
        sfBase->usertime_sec = 0;
        sfBase->systemtime_sec = 0;
    }
#else /* WIN32 */

    sfBase->usertime_sec = 0;
    sfBase->systemtime_sec = 0;

#endif /* WIN32 */    

    if(gettimeofday(&tvTime, NULL) >= 0)
    {
        sfBase->realtime_sec = (double)tvTime.tv_sec +
            ((double)tvTime.tv_usec * 1.0e-6);
    }
    else
    {
        sfBase->realtime_sec = 0;
    }

    sfBase->total_packets = 0;
    sfBase->total_wire_bytes = 0;
    sfBase->total_rebuilt_bytes = 0;
    return 0;
}

/*
**  NAME
**    UpdateBaseStats
**
**  DESCRIPTION
**    Simple update of stats.
**
**  FORMAL INPUTS
**    SFBASE * - structure to update
**    int      - length of packet payload in bytes
**
**  FORMAL OUTPUTS
**    int - 0 is successful
**
*/
int UpdateBaseStats(SFBASE *sfBase, int len, int iRebuiltPkt)
{

    if(iRebuiltPkt)
    {
        sfBase->total_rebuilt_bytes += len;
    }
    else
    {
        sfBase->total_packets++;
        
	if( len < 60 )
        {
            sfBase->total_wire_bytes += 84;
        }
        else
        { 
            sfBase->total_wire_bytes += len + 24; 
        }
    }

    return 0;
}

/*
**  NAME
**    ProcessBaseStats
**
**  DESCRIPTION
**    Main function to process Base Stats.
**
**  FORMAL INPUTS
**    SFBASE * - ptr to update.
**
**  FORMAL OUTPUTS
**    int - 0 is successful
*/
int ProcessBaseStats(SFBASE *sfBase, int console, int file, FILE * fh)
{
    SFBASE_STATS sfBaseStats;

    if( console || file )
        CalculateBasePerfStats(sfBase, &sfBaseStats);

    if( console )
	DisplayBasePerfStatsConsole(&sfBaseStats, sfBase->iFlags);
    
    if( file )
	LogBasePerfStats(&sfBaseStats, fh );

    return 0;
}

int GetRealTime(SYSTIMES *Systimes, SFBASE *sfBase)
{
    struct timeval tvTime;

    if(gettimeofday(&tvTime, NULL) < 0)
    {
        return 1;
    }

    Systimes->realtime =  ((double)tvTime.tv_sec + 
                           ((double)tvTime.tv_usec * 1.0e-6)) -
        sfBase->realtime_sec;

    return 0;
}

int GetEventsPerSecond(SFBASE *sfBase, SFBASE_STATS *sfBaseStats, 
                       SYSTIMES *Systimes)
{
    sfBaseStats->connects_per_second = 
        (double)(sfBase->iConnects) / Systimes->realtime;
    

    sfBaseStats->new_sessions_per_second = 
        (double)(sfBase->NewSessions) / Systimes->realtime;

    sfBaseStats->deleted_sessions_per_second =
        (double)(sfBase->DeletedSessions) / Systimes->realtime;

    sfBaseStats->alerts_per_second = 
        (double)(pc.alert_pkts - sfBase->iAlerts) / Systimes->realtime;

    sfBase->iAlerts = pc.alert_pkts;
    sfBaseStats->total_sessions = sfBase->TotalSessions;
    sfBaseStats->max_sessions = sfBase->MaxSessions;
    
    sfBaseStats->connects_per_second = 
        (double)(sfBase->iConnects) / Systimes->realtime;
    
    sfBase->iConnects=0;
    sfBase->iConnects=0;
    
    return 0;
}

/*
**  NAME
**    CalculateBasePerfStats
**
**  DESCRIPTION
**
**  TBD
**
**  FORMAL INPUTS
**    SFBASE *       - ptr to performance struct
**    SFBASE_STATS * - ptr to struct to fill in performance stats
**
**  FORMAL OUTPUTS
**    int - 0 is successful
*/
int CalculateBasePerfStats(SFBASE *sfBase, SFBASE_STATS *sfBaseStats)
{
    SYSTIMES        Systimes;
    sfperf_uint64_t total_bytes = sfBase->total_rebuilt_bytes +
        sfBase->total_wire_bytes;
    time_t   clock;
    GetRealTime(&Systimes, sfBase);
    
    /*
    **  Avg. bytes per Packet
    */
    sfBaseStats->avg_bytes_per_packet = (int)((double)(total_bytes) /
                                              (double)(sfBase->total_packets));

    /*
    **  Total packets
    */
    sfBaseStats->total_packets = sfBase->total_packets;


    /*
    **  EventsPerSecond
    **  We get the information from the global variable
    **  PacketCount.
    */
    GetEventsPerSecond(sfBase, sfBaseStats, &Systimes);

    /*
    **  Set the date string for print out
    */
    time(&clock);
    sfBaseStats->time = clock;
    sfBaseStats->Date = ctime(&clock);

    /*
    **  Get rid of newline
    */
    sfBaseStats->Date[strlen(sfBaseStats->Date) - 1] = 0x00;

    return 0;
}


/*
 *   
 *   Log Base Per Stats to File for Use by the MC 
 * 
 */
int LogBasePerfStats(SFBASE_STATS *sfBaseStats,  FILE * fh )
{
    fprintf(fh,"%lu,%.3f,%.3f\n",
            sfBaseStats->time,
            sfBaseStats->alerts_per_second,
            sfBaseStats->connects_per_second
            );

    return 0;
}

/*
**  NAME 
**    DisplayBasePerfStats
** 
**  DESCRIPTION
**    Output Function.  We can easily code multiple output buffers
**    because all that is received is a SFBASE_STATS struct which
**    holds all the information to output.  This current output
**    function just prints to stdout.
**
**  FORMAL INPUTS
**    SFBASE_STATS * - struct with perf information
**    int            - flags for output
**
**  FORMAL OUTPUTS
**    int - 0 is successful
*/
int DisplayBasePerfStatsConsole(SFBASE_STATS *sfBaseStats, int iFlags)
{
    LogMessage("Pkts Recv:   %llu\n\n", sfBaseStats->total_packets);

    /*
    **  Shows the number of snort alerts per second.
    */
    LogMessage("Alerts/Sec  :  %.1f\n",   sfBaseStats->alerts_per_second);
    LogMessage("Avg Bytes/Pkt : %d\n", sfBaseStats->avg_bytes_per_packet);
    LogMessage("Connects/Sec:  %.1f\n", sfBaseStats->connects_per_second);
    LogMessage("New Sessions/Sec:  %.1f\n", sfBaseStats->new_sessions_per_second);
    LogMessage("Deleted Sessions/Sec:  %.1f\n", sfBaseStats->deleted_sessions_per_second);
    LogMessage("Total Sessions:  %llu\n", sfBaseStats->total_sessions);
    LogMessage("Max Sessions:  %llu\n", sfBaseStats->max_sessions);
    
    return 0;
}

#endif /* USE_SF_STATS */
