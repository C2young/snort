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

/* $Id: sp_pattern_match.c,v 1.42 2002/08/19 17:33:00 roesch Exp $ */
#include <errno.h>

#include "sp_pattern_match.h"
#include "rules.h"
#include "plugbase.h"
#include "debug.h"
#include "mstring.h"
#include "util.h" 
#include "parser.h"  /* why does parser.h define Add functions.. */
#include "plugin_enum.h"

static void PayloadSearchInit(char *, OptTreeNode *, int);
static void PayloadSearchListInit(char *, OptTreeNode *, int);
static void ParseContentListFile(char *, OptTreeNode *, int);
static void PayloadSearchUri(char *, OptTreeNode *, int);
static void ParsePattern(char *, OptTreeNode *, int);
static int CheckANDPatternMatch(Packet *, struct _OptTreeNode *, OptFpList *);
static int CheckORPatternMatch(Packet *, struct _OptTreeNode *, OptFpList *);
static int CheckUriPatternMatch(Packet *, struct _OptTreeNode *, OptFpList *);
static void PayloadSearchOffset(char *, OptTreeNode *, int);
static void PayloadSearchDepth(char *, OptTreeNode *, int);
static void PayloadSearchNocase(char *, OptTreeNode *, int);
static void PayloadSearchRegex(char *, OptTreeNode *, int);
static void PayloadSearchDistance(char *, OptTreeNode *, int);
static void PayloadSearchWithin(char *, OptTreeNode *, int);
static void PayloadSearchRawbytes(char *, OptTreeNode *, int);

static PatternMatchData * NewNode(OptTreeNode *, int);
void PayloadSearchCompile();

extern int file_line;
extern char *file_name;

int list_file_line;     /* current line being processed in the list file */
int lastType = PLUGIN_PATTERN_MATCH;
int detect_offset_end; /* offset of the last char of the last match */

extern HttpUri UriBufs[URI_COUNT]; /* the set of buffers that we are
				      using to match against set in
				      decode.c */

extern u_int8_t DecodeBuffer[DECODE_BLEN];

void SetupPatternMatch()
{
    RegisterPlugin("content", PayloadSearchInit);
    RegisterPlugin("content-list", PayloadSearchListInit);
    RegisterPlugin("offset", PayloadSearchOffset);
    RegisterPlugin("depth", PayloadSearchDepth);
    RegisterPlugin("nocase", PayloadSearchNocase);
    RegisterPlugin("rawbytes", PayloadSearchRawbytes);
    RegisterPlugin("regex", PayloadSearchRegex);
    RegisterPlugin("uricontent", PayloadSearchUri);
    RegisterPlugin("distance", PayloadSearchDistance);
    RegisterPlugin("within", PayloadSearchWithin);
    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                "Plugin: PatternMatch Initialized!\n"););
}

static inline int computeDepth(int dlen, PatternMatchData * pmd) 
{
    /* do some tests to make sure we stay in bounds */
    if((pmd->depth + pmd->offset) > dlen)
    {
        /* we want to check only depth bytes anyway */
        int sub_depth = dlen - pmd->offset; 

        if((sub_depth > 0) && (sub_depth >= (int)pmd->pattern_size))
        {
            return  sub_depth;
        }
        else
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                        "Pattern Match failed -- sub_depth: %d < "
                        "(int)pmd->pattern_size: %d!\n",
                        sub_depth, (int)pmd->pattern_size););

            return -1;
        }
    }
    else
    {      
        if(pmd->depth && (dlen - pmd->offset > pmd->depth))
        {
            return pmd->depth;
        }
        else
        {
            return dlen - pmd->offset;
        }
    }
}

static inline int computeWithin(int dlen, int start, PatternMatchData *pmd)
{
    if(start + pmd->within > dlen)
    {
        int sub_within = dlen - start;

        if(sub_within > 0 && (sub_within >= (int)pmd->pattern_size))
        {
            return sub_within;
        }
        else
        {
            /* failed, pattern size is greater than number of bytes to search */
            return -1;
        }
    }
    else
    {
        if(dlen - start > pmd->within)
        {
            return pmd->within;
        }
        else
        {
            return dlen - start;
        }
    }

    return -1;
}


static int uniSearchREG(char * data, int dlen, PatternMatchData * pmd)
{
    int depth = computeDepth(dlen, pmd);
    int distance_adjustment = 0;
    int depth_adjustment = 0;

    if(pmd->check_distance != 0)
    {
        distance_adjustment = detect_offset_end + pmd->distance;
    }

    if(pmd->within != 0)
    {
        distance_adjustment = detect_offset_end + pmd->distance;
        depth_adjustment = computeWithin(dlen, distance_adjustment, pmd);
    }

    if (depth < 0)
        return 0;

    return mSearchREG(data + pmd->offset + distance_adjustment, 
            depth_adjustment!=0?depth_adjustment:depth, 
            pmd->pattern_buf, pmd->pattern_size, pmd->skip_stride, 
            pmd->shift_stride);
}

static int uniSearch(char *data, int dlen, PatternMatchData *pmd)
{
    int depth = computeDepth(dlen, pmd);
    int distance_adjustment = 0;
    int depth_adjustment = 0;

    if(pmd->distance != 0)
    {
        distance_adjustment = detect_offset_end + pmd->distance;
    }

    if(pmd->within != 0)
    {
        distance_adjustment = detect_offset_end + pmd->distance;
        depth_adjustment = computeWithin(dlen, distance_adjustment, pmd);
    }

    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, "uniSearch: "););

    if (depth < 0)
        return 0;

    return mSearch(data + pmd->offset + distance_adjustment, 
            depth_adjustment!=0?depth_adjustment:depth, 
            pmd->pattern_buf, pmd->pattern_size, pmd->skip_stride, 
            pmd->shift_stride);
}

#ifndef PATTERN_FAST
static int uniSearchCI(char * data, int dlen, PatternMatchData * pmd)
{
    int depth = computeDepth(dlen, pmd);
    int distance_adjustment = 0;
    int depth_adjustment = 0;

    if(pmd->distance != 0)
    {
        distance_adjustment = detect_offset_end + pmd->distance;
    }

    if(pmd->within != 0)
    {
        distance_adjustment = detect_offset_end + pmd->distance;
        depth_adjustment = computeWithin(dlen, distance_adjustment, pmd);
    }

    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, "uniSearchCI: "););

    if (depth < 0)
	return 0;

    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, 
                "%.20s depth %d for %s size %d: ", data+pmd->offset, depth, 
                pmd->pattern_buf, pmd->pattern_size););

    return mSearchCI(data + pmd->offset + distance_adjustment, 
             depth_adjustment!=0?depth_adjustment:depth, 
		     pmd->pattern_buf, pmd->pattern_size, pmd->skip_stride, 
             pmd->shift_stride);
}

#else /* PATTERN_FAST */

#include "substr.h"
extern RuleListNode *RuleLists;
extern PacketCount pc;
static int compiled = 0;

static int setSearch(char * data, int dlen, PatternMatchData * pmd)
{
    struct substr_search_result res;

    if (!compiled) 
    {
        PayloadSearchCompile();
        compiled = 1;
    }

    if (!pmd->set) 
    { 
        fprintf(stderr,"Error: Setless search!\n"); 
        return(0); 
    }

    if (pmd->set->run != pc.total) {
        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                    "Cache miss on %p pkt %u\n", 
                    pmd->set, pc.total););

        memset(&res, 0, sizeof(res));

        /* Find all matches in set */
        while(1) 
        {
            PatternMatchData *found;

            if (!substr_search(pmd->set->search, data, dlen, &res))
                break;

            found = res.p->handle;

            /* Make sure it was within the specified depth and offset */
            if ((found->depth && ((res.shift + res.p->len) > 
                (found->offset + found->depth))) /* Violates pattern's depth */
                || (res.shift < found->offset)) /* Violates pattern's offset */
                continue;

            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                        "found %s(%p) at %d\n", found->pattern_buf, found, 
                        res.shift););

            found->seen = pc.total;
        } 

        pmd->set->run = pc.total;

#ifdef PATTERN_STATS
        if (pmd->set->size > 1) 
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                        "set reuse rate of %p(%i) is %g (%i / %i)\n", 
                        pmd->set, pmd->set->size,
                        (double)pmd->set->used/(double)pmd->set->generated, 
                        pmd->set->used, pmd->set->generated ););
        }
#endif /* PATTERN_STATS */
        pmd->set->generated++;
    } 
    else 
    {
        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                    "Cache hit on %p at %u\n", pmd->set, pc.total););
    }
#ifdef PATTERN_STATS
    pmd->set->used++;
#endif /* PATTERN_STATS */
    /* check cache */

    if (pmd->seen != pc.total) 
    { 
        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                    "Pattern match failed\n"););

        /* Try to prevent false matches due to overflow of pktno */
        /* False match only if this rule matched exactly 2**32 packets
           ago and hasn't been tested since */
        pmd->seen = pc.total-1; 

        return(0);
    }

    return 1;
}

void SetAddPattern(PatternMatchData * pmd, struct search_set ** setp)
{
    struct search_set * set = *setp;

    if (pmd->search != setSearch) return;

    if (pmd->pattern_size < MINLEN)  
    {
        /* Make a singleton set */
        struct search_set * s;

        s = (struct search_set *)malloc(sizeof(struct search_set));

        if (!s) 
        {
            fprintf(stderr,"memory allocation error!\n");
        }

        s->search = substr_new(SUBSTR_FAST);
        substr_add(s->search, pmd->pattern_size, pmd->pattern_buf, pmd->nocase, 
                pmd, pmd->offset, pmd->depth);
        s->used = s->generated = 0;
        s->size = 1;
        pmd->set = s;
        substr_compile(s->search);
        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                    "Short pattern put in set by itself\n"););
        return;
    }

    if (!set) 
    {
        set = (struct search_set *)malloc(sizeof(struct search_set));

        if (!set) 
        {
            fprintf(stderr,"memory allocation error!\n");
        }
        set->size = 0;
        set->used = set->generated = 0;

#ifdef BASELINE
        set->search = substr_new(SUBSTR_BM);
#else /* BASELINE */
        set->search = substr_new(SUBSTR_FAST);
#endif /* BASELINE */
    }

    substr_add(set->search, pmd->pattern_size, pmd->pattern_buf, pmd->nocase, 
            pmd, pmd->offset, pmd->depth);
    set->size++;
    pmd->set = set;

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Added %.*s to %p\n", 
                pmd->pattern_size, pmd->pattern_buf, set););

    *setp = set;

}

void CompileSet(struct search_set ** set, char * proto)
{
    if (*set) 
    {
        substr_compile((*set)->search);
        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                    "Plugin: %s set size = %u\n", 
                    proto, (*set)->size););
        *set = NULL;
    }    
}

void SetAddRules(RuleTreeNode *rtn, struct search_set ** setp, 
        struct search_set ** urisetp)
{
    PatternMatchData * pmd;
    OptTreeNode * otn;

    for (; rtn != NULL; rtn = rtn->right) 
    {
        for(otn = rtn->down; otn != NULL; otn=otn->next) 
        {
            for(pmd=otn->ds_list[PLUGIN_PATTERN_MATCH];pmd!=NULL;pmd=pmd->next) 
                SetAddPattern(pmd, setp);

            for(pmd=otn->ds_list[PLUGIN_PATTERN_MATCH_OR];pmd!=NULL;pmd=pmd->next) 
                SetAddPattern(pmd, setp);
            for(pmd=otn->ds_list[PLUGIN_PATTERN_MATCH_URI];pmd!=NULL;pmd=pmd->next) 
                SetAddPattern(pmd, urisetp);
        }

        CompileSet(urisetp, "per-RTN URI");
        CompileSet(setp, "per-RTN");
    }

    /* Pass current set back to caller in case they wish to expand it */
}

/* 
 * Compile all rule chains, but group them by type of packet
 * and make separate sets for each type of packet.
 */
void PayloadSearchCompile()
{
    struct search_set * set = NULL;
    struct search_set * uriset = NULL;
    RuleListNode * rule;

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                "Plugin: In PayloadSearchCompile()\n"););

    for (rule=RuleLists; rule; rule=rule->next)
        SetAddRules(rule->RuleList->IpList, &set, &uriset);
    CompileSet( &uriset, "IP URI");
    CompileSet( &set, "IP");

    for (rule=RuleLists; rule; rule=rule->next)
        SetAddRules(rule->RuleList->TcpList, &set, &uriset);
    CompileSet( &uriset, "TCP URI");
    CompileSet( &set, "TCP");

    for (rule=RuleLists; rule; rule=rule->next)
        SetAddRules(rule->RuleList->UdpList, &set, &uriset);
    CompileSet( &uriset, "UDP URI");
    CompileSet( &set, "UDP");

    for (rule=RuleLists; rule; rule=rule->next)
        SetAddRules(rule->RuleList->IcmpList, &set, &uriset);
    CompileSet( &uriset, "ICMP URI");
    CompileSet( &set, "ICMP");

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Plugin: PayloadSearchCompile() Done\n"););

}
	

#endif

static void make_precomp(PatternMatchData * idx)
{
    free(idx->skip_stride);
    free(idx->shift_stride);

    idx->skip_stride = make_skip(idx->pattern_buf, idx->pattern_size);
    idx->shift_stride = make_shift(idx->pattern_buf, idx->pattern_size);

}

void PayloadSearchListInit(char *data, OptTreeNode * otn, int protocol)
{
    char *sptr;
    char *eptr;

    lastType = PLUGIN_PATTERN_MATCH_OR;

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "In PayloadSearchListInit()\n"););

    /* get the path/file name from the data */
    while(isspace((int) *data))
        data++;

    /* grab everything between the starting " and the end one */
    sptr = index(data, '"');
    eptr = strrchr(data, '"');

    if(sptr != NULL && eptr != NULL)
    {
        /* increment past the first quote */
        sptr++;

        /* zero out the second one */
        *eptr = 0;
    }
    else
    {
        sptr = data;
    }

    /* read the content keywords from the list file */
    ParseContentListFile(sptr, otn, protocol);


    /* link the plugin function in to the current OTN */
    AddOptFuncToList(CheckORPatternMatch, otn);

    return;
}


void PayloadSearchInit(char *data, OptTreeNode * otn, int protocol)
{
    lastType = PLUGIN_PATTERN_MATCH;

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "In PayloadSearchInit()\n"););

    /* whack a new node onto the list */
    NewNode(otn, PLUGIN_PATTERN_MATCH);

    /* set up the pattern buffer */
    ParsePattern(data, otn, PLUGIN_PATTERN_MATCH);

    /* link the plugin function in to the current OTN */
    AddOptFuncToList(CheckANDPatternMatch, otn);

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "OTN function PatternMatch Added to rule!\n"););
}



void PayloadSearchUri(char *data, OptTreeNode * otn, int protocol)
{
    PatternMatchData * pmd;

    lastType = PLUGIN_PATTERN_MATCH_URI;
    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "In PayloadSearchUri()\n"););

    /* whack a new node onto the list */
    pmd = NewNode(otn, PLUGIN_PATTERN_MATCH_URI);

    /* set up the pattern buffer */
    ParsePattern(data, otn, PLUGIN_PATTERN_MATCH_URI);

#ifdef PATTERN_FAST
    pmd->search = uniSearch;
    make_precomp(pmd);
#endif

    /* link the plugin function in to the current OTN */
    AddOptFuncToList(CheckUriPatternMatch, otn);

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "OTN function PatternMatch Added to rule!\n"););
}




void PayloadSearchOffset(char *data, OptTreeNode * otn, int protocol)
{
    PatternMatchData *idx;

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "In PayloadSearch()\n"););

    idx = otn->ds_list[lastType];

    if(idx == NULL)
    {
        FatalError("ERROR %s Line %d => Please place \"content\" rules before depth, nocase or offset modifiers.\n", file_name, file_line);
    }

    while(idx->next != NULL)
        idx = idx->next;

    while(isspace((int) *data))
        data++;

    idx->offset = strtol(data, NULL, 10);

    if(errno == ERANGE)
    {
        FatalError("ERROR %s Line %d => Range problem on offset value\n", 
                file_name, file_line);
    }

    if(idx->offset > 65535)
    {
        FatalError("ERROR %s Line %d => Offset greater than max Ipv4 "
                "packet size\n", file_name, file_line);
    }

    DEBUG_WRAP(DebugMessage(DEBUG_PARSER, "Pattern offset = %d\n", 
                idx->offset););

    return;
}



void PayloadSearchDepth(char *data, OptTreeNode * otn, int protocol)
{
    PatternMatchData *idx;

    idx = (PatternMatchData *) otn->ds_list[lastType];

    if(idx == NULL)
    {
        FatalError("ERROR %s Line %d => Please place \"content\" rules "
                "before depth, nocase or offset modifiers.\n", 
                file_name, file_line);
    }

    while(idx->next != NULL)
        idx = idx->next;

    while(isspace((int) *data))
        data++;

    idx->depth = strtol(data, NULL, 10);

    if(errno == ERANGE)
    {
        FatalError("ERROR %s Line %d => Range problem on depth value\n", 
                file_name, file_line);
    }

    if(idx->offset > 65535)
    {
        FatalError("ERROR %s Line %d => Depth greater than max Ipv4 "
                "packet size\n", file_name, file_line);
    }

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Pattern offset = %d\n", 
                idx->offset););

    return;
}

void PayloadSearchNocase(char *data, OptTreeNode * otn, int protocol)
{
    PatternMatchData *idx;
    int i;

    idx = (PatternMatchData *) otn->ds_list[lastType];

    if(idx == NULL)
    {
        FatalError("ERROR Line %d => Please place \"content\" rules before"
		   " depth, nocase or offset modifiers.\n", file_line);
    }
    while(idx->next != NULL)
        idx = idx->next;

    i = idx->pattern_size;

    while(--i >= 0)
        idx->pattern_buf[i] = toupper((unsigned char) idx->pattern_buf[i]);

#ifdef PATTERN_FAST
    idx->search = setSearch;
    idx->nocase = 1;
#else
    idx->search = uniSearchCI;
    make_precomp(idx);
#endif
    return;
}

void PayloadSearchRawbytes(char *data, OptTreeNode * otn, int protocol)
{
    PatternMatchData *idx;

    idx = (PatternMatchData *) otn->ds_list[lastType];

    if(idx == NULL)
    {
        FatalError("ERROR Line %d => Please place \"content\" rules before"
		   " rawbytes, depth, nocase or offset modifiers.\n", file_line);
    }
    while(idx->next != NULL)
        idx = idx->next;

    /* mark this as inspecting a raw pattern match rather than a
       decoded application buffer */
    idx->rawbytes = 1;    
    return;
}



void PayloadSearchDistance(char *data, OptTreeNode *otn, int protocol)
{
    PatternMatchData *idx;

    idx = (PatternMatchData *) otn->ds_list[lastType];

    if(idx == NULL)
    {
        FatalError("Error %s(%d) => Distance without context, please place "
                "\"content\" keywords before distance modifiers\n", file_name,
                file_line);
    }

    while(idx->next != NULL)
        idx = idx->next;

    while(isspace((int) *data))
        data++;

    idx->distance = strtol(data, NULL, 10);
    idx->check_distance = 1;

    if(errno == ERANGE)
    {
        FatalError("ERROR %s Line %d => Range problem on distance value\n", 
                file_name, file_line);
    }

    if(idx->offset > 65530)
    {
        FatalError("ERROR %s Line %d => Distance greater than max Ipv4 "
                "packet size\n", file_name, file_line);
    }

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Pattern distance = %d\n", 
                idx->distance););

    return;
}


void PayloadSearchWithin(char *data, OptTreeNode *otn, int protocol)
{
    PatternMatchData *idx;

    idx = (PatternMatchData *) otn->ds_list[lastType];

    if(idx == NULL)
    {
        FatalError("Error %s(%d) => Distance without context, please place "
                "\"content\" keywords before distance modifiers\n", file_name,
                file_line);
    }

    while(idx->next != NULL)
        idx = idx->next;

    while(isspace((int) *data))
        data++;

    idx->within = strtol(data, NULL, 10);

    if(errno == ERANGE)
    {
        FatalError("ERROR %s Line %d => Range problem on within value\n", 
                file_name, file_line);
    }

    if(idx->offset > 65530)
    {
        FatalError("ERROR %s Line %d => Within greater than max Ipv4 "
                "packet size\n", file_name, file_line);
    }

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Pattern within = %d\n", 
                idx->within););

    return;
}



void PayloadSearchRegex(char *data, OptTreeNode * otn, int protocol)
{
    PatternMatchData *idx;
    int i;

    idx = (PatternMatchData *) otn->ds_list[lastType];

    if(idx == NULL)
    {
        FatalError("ERROR %s Line %d => Please place \"content\" rules "
                   "before regex modifiers.\n", file_name, file_line);
    }

    while(idx->next != NULL)
        idx = idx->next;

    idx->search = uniSearchREG;

    i = idx->pattern_size;

    /*while(--i >= 0)
      {
      printf("uppercasing 0x%X", idx->pattern_buf[i]);
      idx->pattern_buf[i] = toupper((unsigned char) idx->pattern_buf[i]);
      printf("to 0x%X (%c)\n", idx->pattern_buf[i], idx->pattern_buf[i]);
      }*/

    make_precomp(idx);

    return;
}




static PatternMatchData * NewNode(OptTreeNode * otn, int type)
{
    PatternMatchData *idx;

    idx = (PatternMatchData *) otn->ds_list[type];

    if(idx == NULL)
    {
        if((otn->ds_list[type] = 
                    (PatternMatchData *) calloc(sizeof(PatternMatchData), 
                                                sizeof(char))) == NULL)
        {
            FatalError("ERROR => sp_pattern_match NewNode() calloc failed!\n");
        }

        return otn->ds_list[type];
    }
    else
    {
        idx = otn->ds_list[type];

        while(idx->next != NULL)
            idx = idx->next;

        if((idx->next = (PatternMatchData *) 
                    calloc(sizeof(PatternMatchData), sizeof(char))) == NULL)
        {
            FatalError("ERROR => sp_pattern_match NewNode() calloc failed!\n");
        }

        return idx->next;
    }
}



/****************************************************************************
 *
 * Function: ParsePattern(char *)
 *
 * Purpose: Process the application layer patterns and attach them to the
 *          appropriate rule.  My god this is ugly code.
 *
 * Arguments: rule => the pattern string
 *
 * Returns: void function
 *
 ***************************************************************************/
static void ParsePattern(char *rule, OptTreeNode * otn, int type)
{
    unsigned char tmp_buf[2048];

    /* got enough ptrs for you? */
    char *start_ptr;
    char *end_ptr;
    char *idx;
    char *dummy_idx;
    char *dummy_end;
    char hex_buf[9];
    u_int dummy_size = 0;
    u_int size;
    int hexmode = 0;
    int hexsize = 0;
    int pending = 0;
    int cnt = 0;
    int literal = 0;
    int exception_flag = 0;
    PatternMatchData *ds_idx;

    /* clear out the temp buffer */
    bzero(tmp_buf, 2048);

    if(rule == NULL)
    {
        FatalError("ERROR %s Line %d => ParsePattern Got Null "
		   "enclosed in quotation marks (\")!\n", 
		   file_name, file_line);
    }

    while(isspace((int)*rule))
        rule++;

    if(*rule == '!')
    {
        exception_flag = 1;
    }

    /* find the start of the data */
    start_ptr = index(rule, '"');

    if(start_ptr == NULL)
    {
        FatalError("ERROR %s Line %d => Content data needs to be "
		   "enclosed in quotation marks (\")!\n", 
		   file_name, file_line);
    }

    /* move the start up from the beggining quotes */
    start_ptr++;

    /* find the end of the data */
    end_ptr = strrchr(start_ptr, '"');

    if(end_ptr == NULL)
    {
        FatalError("ERROR %s Line %d => Content data needs to be enclosed "
                   "in quotation marks (\")!\n", file_name, file_line);
    }

    /* set the end to be NULL */
    *end_ptr = 0;

    /* how big is it?? */
    size = end_ptr - start_ptr;

    /* uh, this shouldn't happen */
    if(size <= 0)
    {
        FatalError("ERROR %s Line %d => Bad pattern length!\n", 
                   file_name, file_line);
    }
    /* set all the pointers to the appropriate places... */
    idx = start_ptr;

    /* set the indexes into the temp buffer */
    dummy_idx = tmp_buf;
    dummy_end = (dummy_idx + size);

    /* why is this buffer so small? */
    bzero(hex_buf, 9);
    memset(hex_buf, '0', 8);

    /* BEGIN BAD JUJU..... */
    while(idx < end_ptr)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_PARSER, "processing char: %c\n", *idx););
        switch(*idx)
        {
	case '|':
	    DEBUG_WRAP(DebugMessage(DEBUG_PARSER, "Got bar... "););
	    if(!literal)
	    {
		DEBUG_WRAP(DebugMessage(DEBUG_PARSER, "not in literal mode... "););
		if(!hexmode)
		{
		    DEBUG_WRAP(DebugMessage(DEBUG_PARSER, "Entering hexmode\n"););
		    hexmode = 1;
		}
		else
		{
		    DEBUG_WRAP(DebugMessage(DEBUG_PARSER, "Exiting hexmode\n"););
		    hexmode = 0;
		    pending = 0;
		}

		if(hexmode)
		    hexsize = 0;
	    }
	    else
	    {
		DEBUG_WRAP(DebugMessage(DEBUG_PARSER, "literal set, Clearing\n"););
		literal = 0;
		tmp_buf[dummy_size] = start_ptr[cnt];
		dummy_size++;
	    }

	    break;

	case '\\':
	    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Got literal char... "););

	    if(!literal)
	    {
		DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Setting literal\n"););

		literal = 1;
	    }
	    else
	    {
		DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Clearing literal\n"););
		tmp_buf[dummy_size] = start_ptr[cnt];
		literal = 0;
		dummy_size++;
	    }

	    break;
	case '"':
	    if (!literal) {
		FatalError("ERROR %s Line %d => Non-escaped "
			   " '\"' character!\n", file_name, file_line);
	    }
            /* otherwise process the character as default */
	default:
	    if(hexmode)
	    {
		if(isxdigit((int) *idx))
		{
		    hexsize++;

		    if(!pending)
		    {
			hex_buf[7] = *idx;
			pending++;
		    }
		    else
		    {
			hex_buf[8] = *idx;
			pending--;

			if(dummy_idx < dummy_end)
			{
			    tmp_buf[dummy_size] = (u_char) 
				strtol(hex_buf, (char **) NULL, 16);

			    dummy_size++;
			    bzero(hex_buf, 9);
			    memset(hex_buf, '0', 8);
			}
			else
			{
			    FatalError("ERROR => ParsePattern() dummy "
				       "buffer overflow, make a smaller "
				       "pattern please! (Max size = 2048)\n");
			}
		    }
		}
		else
		{
		    if(*idx != ' ')
		    {
			FatalError("ERROR %s Line %d => What is this "
				   "\"%c\"(0x%X) doing in your binary "
				   "buffer?  Valid hex values only please! "
				   "(0x0 - 0xF) Position: %d\n",
				   file_name, 
				   file_line, (char) *idx, (char) *idx, cnt);
		    }
		}
	    }
	    else
	    {
		if(*idx >= 0x1F && *idx <= 0x7e)
		{
		    if(dummy_idx < dummy_end)
		    {
			tmp_buf[dummy_size] = start_ptr[cnt];
			dummy_size++;
		    }
		    else
		    {
			FatalError("ERROR %s Line %d=> ParsePattern() "
				   "dummy buffer overflow!\n", file_name, file_line);
		    }

		    if(literal)
		    {
			literal = 0;
		    }
		}
		else
		{
		    if(literal)
		    {
			tmp_buf[dummy_size] = start_ptr[cnt];
			dummy_size++;
			DEBUG_WRAP(DebugMessage(DEBUG_PARSER, "Clearing literal\n"););
			literal = 0;
		    }
		    else
		    {
			FatalError("ERROR %s Line %d=> character value out "
				   "of range, try a binary buffer dude\n", 
				   file_name, file_line);
		    }
		}
	    }

	    break;
        }

        dummy_idx++;
        idx++;
        cnt++;
    }
    /* ...END BAD JUJU */

    /* error prunning */

    if (literal) {
        FatalError("ERROR %s Line %d=> backslash escape is not "
		   "completed\n", file_name, file_line);
    }
    if (hexmode) {
        FatalError("ERROR %s Line %d=> hexmode is not "
		   "completed\n", file_name, file_line);
    }

    ds_idx = (PatternMatchData *) otn->ds_list[type];

    while(ds_idx->next != NULL)
        ds_idx = ds_idx->next;

    if((ds_idx->pattern_buf = (char *) calloc(dummy_size+1, sizeof(char))) 
       == NULL)
    {
        FatalError("ERROR => ParsePattern() pattern_buf malloc failed!\n");
    }

    memcpy(ds_idx->pattern_buf, tmp_buf, dummy_size);

    ds_idx->pattern_size = dummy_size;

#ifdef PATTERN_FAST
    ds_idx->search = setSearch;
#else
    ds_idx->search = uniSearch;
    make_precomp(ds_idx);
#endif

    ds_idx->exception_flag = exception_flag;

    return;
}

static int CheckORPatternMatch(Packet * p, struct _OptTreeNode * otn_idx, 
			       OptFpList * fp_list)
{
    int found = 0;
    int dsize;
    char *dp;
    
    PatternMatchData *idx;

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "CheckPatternORMatch: "););
    
    idx = otn_idx->ds_list[PLUGIN_PATTERN_MATCH_OR];

    while(idx != NULL)
    {        
        if((p->packet_flags & PKT_ALT_DECODE) && (idx->rawbytes == 0))
        {
            dsize = p->alt_dsize;
            dp = (char *) DecodeBuffer; /* decode.c */
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                                    "Using Alternative Decode buffer!\n"););
        }
        else
        {
            dsize = p->dsize;
            dp = (char *) p->data;
        }
        
        if(idx->offset > dsize)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                        "Initial offset larger than payload!\n"););

            goto sizetoosmall;
        }
        else
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                        "testing pattern: %s\n", idx->pattern_buf););
            found = idx->search(dp, dsize, idx);

            if(!found)
            {
                DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                            "Pattern Match failed!\n"););
            }
        }

        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                    "Checking the results\n"););

        if(found)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Pattern Match "
				    "successful: %s!\n", idx->pattern_buf););

            return fp_list->next->OptTestFunc(p, otn_idx, fp_list->next);

        }
        else
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                        "Pattern match failed\n"););
        }

        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                    "Stepping to next content keyword\n"););

    sizetoosmall:

        idx = idx->next;
    }

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                "No more keywords, exiting... \n"););

    return 0;
}

static int CheckANDPatternMatch(Packet *p, struct _OptTreeNode *otn_idx, 
				OptFpList *fp_list)
{
    int sub_depth;
    int found = 0;
    int dsize;
    char *dp;

    PatternMatchData *idx;

    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "CheckPatternANDMatch: "););

    idx = otn_idx->ds_list[PLUGIN_PATTERN_MATCH];
    
    while(idx != NULL)
    {
        if((p->packet_flags & PKT_ALT_DECODE) && (idx->rawbytes == 0))
        {
            dsize = p->alt_dsize;
            dp = (char *) DecodeBuffer; /* decode.c */
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                                    "Using Alternative Decode buffer!\n"););
        }
        else
        {
            dsize = p->dsize;
            dp = (char *) p->data;
        }
        
        if(idx->offset > dsize)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
				    "Initial offset larger than payload!\n"););
            return 0;
        }
        else
        {
            /* do some tests to make sure we stay in bounds */
            if((idx->depth + idx->offset) > dsize)
            {
                /* we want to match depth bytes anyway */
                sub_depth = dsize - idx->offset; 

                if((sub_depth > 0) && (sub_depth >= (int)idx->pattern_size))
                {
                    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                                "testing pattern: %s\n", idx->pattern_buf););

                    found = (idx->search(dp, dsize, idx)
                            ^ idx->exception_flag);

                    if(!found)
                    {
                        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                                    "Pattern Match failed!\n"););

                        return 0;
                    }
                } 
                else 
                {
                    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                                "Pattern Match failed -- sub_depth: %d < "
                                "(int)idx->pattern_size: %d!\n",
                                sub_depth, (int)idx->pattern_size););
                    return 0;
                }
		    
            }
            else
            {
                DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
			     "Testing pattern (lower section): %s\n", 
					idx->pattern_buf););

                /* if depth field is present and we don't go over the 
                 * dsize boundary with it 
                 */
                if(idx->depth && (dsize - idx->offset > idx->depth))
                {
                    found = (idx->search(dp, dsize, idx)
                            ^ idx->exception_flag);
                }
                else
                {
                    found = (idx->search(dp, dsize, idx)
                            ^ idx->exception_flag);
                }

                if(!found)
                {
                    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
					    "Pattern Match failed!\n"););

                    return 0;
                }
            }
        }

        idx = idx->next;

        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
				"Stepping to next content keyword...\n"););
    }

    if(found)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
                    "Pattern Match successful!\n"););

        return fp_list->next->OptTestFunc(p, otn_idx, fp_list->next);

    }
    else
    {
        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Pattern match failed\n"););
    }

    return 0;
}

/* Given a idx structure and some data, return if we find something.
 *
 *  
 *
 *
 */
static inline int DetectLoop(PatternMatchData *idx, char *data, int dsize)
{
    int found = 0;

    while(idx != NULL)
    {
        if(idx->offset > dsize)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, 
                        "Initial offset larger than payload!\n"););

            return 0;
        }
        else
        {
            found = (idx->search(data, dsize, idx) 
                    ^ idx->exception_flag);

            if(!found)
            {
                DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, 
                            "Pattern Match failed!\n"););

                return 0;
            }
        }

        idx = idx->next;
        DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, 
                    "Stepping to next content keyword...\n"););
    }

    return found;
}

/************************************************************************/
/************************************************************************/
/************************************************************************/

static int CheckUriPatternMatch(Packet *p, struct _OptTreeNode *otn_idx, 
				OptFpList *fp_list)
{
    int found = 0;
    int i;
    PatternMatchData *idx;

    if(p->uri_count <= 0)
    {
	DEBUG_WRAP(DebugMessage(DEBUG_HTTP_DECODE,
				"CheckUriPatternMatch: p->uri_count is %d. Returning",
				p->uri_count););
	return 0;
    }

    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, "CheckUriPatternMatch: "););

    idx = otn_idx->ds_list[PLUGIN_PATTERN_MATCH_URI];

    for(i=0;i < p->uri_count; i++)
    {
	
#ifdef DEBUG /* for variable declaration */
	int j;

	DebugMessage(DEBUG_HTTP_DECODE,"Checking against URL: ");
	for(j=0; j<=UriBufs[i].length; j++)
	{
	    DebugMessage(DEBUG_HTTP_DECODE, "%c", UriBufs[i].uri[j]);
	}
	DebugMessage(DEBUG_HTTP_DECODE,"\n");
	
#endif /* DEBUG */
	    
	found = DetectLoop(idx, UriBufs[i].uri, UriBufs[i].length);

	if(found)
	{
	    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN,
				    "Pattern Match successful!\n"););	    
	    return fp_list->next->OptTestFunc(p, otn_idx, fp_list->next);
	}
    }

    DEBUG_WRAP(DebugMessage(DEBUG_PLUGIN, "Pattern match failed\n"););

    return 0;


}



/****************************************************************************
 *
 * Function: ParseContentListFile(char *, OptTreeNode *, int protocol)
 *
 * Purpose:  Read the content_list file a line at a time, put the content of
 *           the line into buffer
 *
 * Arguments:otn => rule including the list
 *           file => list file filename
 *	     protocol => protocol
 *
 * Returns: void function
 *
 ***************************************************************************/
static void ParseContentListFile(char *file, OptTreeNode * otn, int protocol)
{
    FILE *thefp;                /* file pointer for the content_list file */
    char buf[STD_BUF+1];        /* file read buffer */
    char rule_buf[STD_BUF+1];   /* content keyword buffer */
    int frazes_count;           /* frazes counter */


#ifdef DEBUG
    PatternMatchData *idx;
    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Opening content_list file: %s\n", file););
#endif /* DEBUG */
    /* open the list file */
    if((thefp = fopen(file, "r")) == NULL)
    {
        FatalError("Unable to open list file: %s\n", file);
    }
    /* clear the line and rule buffers */
    bzero((char *) buf, STD_BUF);
    bzero((char *) rule_buf, STD_BUF);
    frazes_count = 0;

    /* loop thru each list_file line and content to the rule */
    while((fgets(buf, STD_BUF-2, thefp)) != NULL)
    {
        /* inc the line counter */
        list_file_line++;

        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Got line %d: %s", 
				list_file_line, buf););

        /* if it's not a comment or a <CR>, send it to the parser */
        if((buf[0] != '#') && (buf[0] != 0x0a) && (buf[0] != ';'))
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, 
				    "Adding content keyword: %s", buf););

            frazes_count++;
            strip(buf);

            NewNode(otn, PLUGIN_PATTERN_MATCH_OR);

            /* check and add content keyword */
            ParsePattern(buf, otn, PLUGIN_PATTERN_MATCH_OR);

            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Content keyword %s\" added!\n", 
				    buf););
        }
    }
#ifdef DEBUG
    DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "%d frazes read...\n", frazes_count););
    idx = (PatternMatchData *) otn->ds_list[PLUGIN_PATTERN_MATCH_OR];
    
    if(idx == NULL)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "No patterns loaded\n"););
    }
    else
    {
        while(idx != NULL)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_PATTERN_MATCH, "Pattern = %s\n", 
				    idx->pattern_buf););
            idx = idx->next;
        }
    }
#endif /* DEBUG */
    
    fclose(thefp);

    return;
}
