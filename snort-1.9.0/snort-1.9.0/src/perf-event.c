#ifdef USE_SF_STATS
/*
**  $Id: perf-event.c,v 1.2 2002/08/12 20:07:52 chrisgreen Exp $
**
**  perf-event.c
**
**  Copyright (C) 2002 Sourcefire,Inc
**  Marc Norton
**  Dan Roelker
**
**  NOTES
**  5.28.02 - Initial Source Code. Norton/Roelker
**
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

#include "snort.h"
#include "util.h"

int DisplayEventPerfStats(SFEVENT_STATS *sfEventStats);

SFEVENT *GetEventPtr() { return &sfPerf.sfEvent; }

int InitEventStats(SFEVENT *sfEvent)
{
    return 0;
}


int ProcessEventStats(SFEVENT *sfEvent)
{
    SFEVENT_STATS sfEventStats;

    sfEventStats.TotalEvents = sfEvent->TotalEvents;

    sfEvent->TotalEvents = 0;
    
    DisplayEventPerfStats(&sfEventStats);
        
    return 0;
}

int DisplayEventPerfStats(SFEVENT_STATS *sfEventStats)
{
    LogMessage("\n\nSnort Event Stats\n");
    LogMessage(    "-------------------------\n");

    LogMessage( "Total Events:           %llu\n", sfEventStats->TotalEvents);

    return 0;
}
    

int UpdateEvents()
{
    sfPerf.sfEvent.TotalEvents++;
    return 0;
}

#endif /* USE_SF_STATS */
