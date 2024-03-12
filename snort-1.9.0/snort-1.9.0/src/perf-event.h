/*
**  $Id: perf-event.h,v 1.2 2002/08/18 16:16:31 chrisgreen Exp $
**
**  perf-event.h
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

#ifndef __PERF_EVENT__
#define __PERF_EVENT__

#include "perf.h"

typedef struct _SFEVENT {

    sfperf_uint64_t NQEvents;
    sfperf_uint64_t QEvents;

    sfperf_uint64_t TotalEvents;

} SFEVENT;

typedef struct _SFEVENT_STATS {

    sfperf_uint64_t TotalEvents;
}  SFEVENT_STATS;

/*
**  These functions are for interfacing with the main
**  perf module.
*/ 
int InitEventStats(SFEVENT *sfEvent);
int ProcessEventStats(SFEVENT *sfEvent);

int UpdateEvents();

#endif
