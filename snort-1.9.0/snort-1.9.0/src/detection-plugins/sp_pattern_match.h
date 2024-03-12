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

/* $Id: sp_pattern_match.h,v 1.16 2002/08/13 15:04:22 chrisgreen Exp $ */
#ifndef __SP_PATTERN_MATCH_H__
#define __SP_PATTERN_MATCH_H__

#include "snort.h"
#include "debug.h"
#include <ctype.h>

/* #define PATTERN_FAST Use set-wise algorithms */

#ifdef PATTERN_FAST
#include "substr.h"

#define MINLEN 0
struct search_set {
    substr_object * search;
    unsigned int run;
    int size;
    int generated;
    int used;
};
#endif /* PATTERN_FAST */

typedef struct _PatternMatchData
{
    u_int8_t exception_flag; /* search for "not this pattern" */
    int offset;             /* pattern search start offset */
    int depth;              /* pattern search depth */
    int distance;           /* offset to start from based on last match */
    int within;             /* this pattern must be found 
                               within X bytes of last match*/
    int rawbytes;           /* Search the raw bytes rather than any decoded app
                               buffer */
    u_int pattern_size;     /* size of app layer pattern */
    char check_distance;
    char *pattern_buf;      /* app layer pattern to match on */
    int (*search)(char *, int, struct _PatternMatchData *);  /* search function */
    int *skip_stride; /* B-M skip array */
    int *shift_stride; /* B-M shift array */
    struct _PatternMatchData *next; /* ptr to next match struct */
#ifdef PATTERN_FAST
    struct search_set * set; /* data structure shared by set */
    int seen;
    int nocase;
#endif /* PATTERN_FAST */
} PatternMatchData;

void SetupPatternMatch();

#endif /* __SP_PATTERN_MATCH_H__ */
