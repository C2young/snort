/* $Id: threshold.h,v 1.1 2002/08/26 22:09:20 roesch Exp $ */
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


#ifndef _THRESHOLD_H_
#define _THRESHOLD_H_

#include <stdio.h>
#include <limits.h>
#include <sys/types.h>
#include <string.h>
#include <ctype.h>

#include "decode.h"
#include "event.h"
#include "rules.h"
#include "util.h"

#define THRESHOLD_TYPE_EVENT    0
#define THRESHOLD_TYPE_IP       1
#define THRESHOLD_TYPE_PORT     2

int Threshold(Packet *, Event *, u_int32_t, u_int32_t, u_int8_t);
void ParseThreshold(char *, u_int32_t *, u_int32_t *, u_int8_t *);

#endif /* _THRESHOLD_H_ */
