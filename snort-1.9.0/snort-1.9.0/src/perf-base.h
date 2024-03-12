/*
** $Id: perf-base.h,v 1.2 2002/08/18 16:16:31 chrisgreen Exp $
**
** perf-base.h
**
** Copyright (C) 2002 Sourcefire,Inc
** Dan Roelker
**
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
**
*/
#ifndef _PERFBASE_H
#define _PERFBASE_H

#include "config.h"

#include <time.h>

#define MAX_PERF_STATS 1

typedef struct _PKTSTATS {

    sfperf_uint64_t pkts_recv;
    sfperf_uint64_t pkts_drop;

}  PKTSTATS;

typedef struct _SFBASE {

    sfperf_uint64_t   total_packets;
    sfperf_uint64_t   total_wire_bytes;
    sfperf_uint64_t   total_rebuilt_bytes;

    PKTSTATS pkt_stats;

    double   usertime_sec;
    double   systemtime_sec;
    double   realtime_sec;

    time_t time;

    sfperf_uint64_t   iAlerts;
    sfperf_uint64_t   iConnects;
    sfperf_uint64_t   TotalSessions;
    sfperf_uint64_t   NewSessions;
    sfperf_uint64_t   DeletedSessions;
    sfperf_uint64_t   MaxSessions;
    int      iFlags;
}  SFBASE;

typedef struct _SYSTIMES {

    double usertime;
    double systemtime;
    double totaltime;
    double realtime;

}  SYSTIMES;

typedef struct _SFBASE_STATS {

    sfperf_uint64_t   total_packets;
    sfperf_uint64_t   total_sessions;
    sfperf_uint64_t   max_sessions;
    int      avg_bytes_per_packet;
    double   alerts_per_second;
    double   connects_per_second;
    double   deleted_sessions_per_second;
    double   new_sessions_per_second;
    char     *Date;
    time_t   time;
}  SFBASE_STATS;

int InitBaseStats(SFBASE *sfBase);
int UpdateBaseStats(SFBASE *sfBase, int len, int iRebuiltPkt);
int ProcessBaseStats(SFBASE *sfBase,int console, int file, FILE * fh);

#endif


