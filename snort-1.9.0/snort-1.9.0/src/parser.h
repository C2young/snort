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

/* $Id: parser.h,v 1.12 2002/07/23 22:12:53 chrisgreen Exp $ */
#ifndef __PARSER_H__
#define __PARSER_H__


#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "rules.h"
#include "decode.h"

#include <stdio.h>

/* parsing functions */ 
#define ONE_CHECK(_onevar,xxx)                                      \
   (_onevar)++;                                                     \
   if ((_onevar) > 1)                                               \
   {                                                                \
       FatalError("\nERROR: %s(%d) => Only one '%s' option per rule\n",\
                       file_name, file_line, xxx);                  \
   }

/* rule setup funcs */
void ParseRulesFile(char *, int);
int ContinuationCheck(char *);
void ParseRule(FILE*, char *, int);
void ParsePreprocessor(char *);
void ParseOutputPlugin(char *);
void ParseRuleOptions(char *, int, int);
void ParseMessage(char *);
void ParseLogto(char *);
void DumpRuleChains();
struct VarEntry *VarDefine(char *, char *);
void VarDelete(char *);
void IntegrityCheckRules();
void ParseListFile(char *, char *);
void LinkDynamicRules();
void ParseActivatedBy(char *);
void ParseActivates(char *);
void ParseCount(char *);
/* XXX: implemented in detect.c */
void CreateDefaultRules();
void OrderRuleLists(char *);
void printRuleOrder();



int CheckRule(char *);
int RuleType(char *);
int WhichProto(char *);
int ParseIP(char *, IpAddrSet *);
int ParsePort(char *, u_short *,  u_short *, char *, int *);
int ConvPort(char *, char *);

char *VarGet(char *);
char *ExpandVars(char *);
char *CreateRule(char *, char *, char *);

struct VarEntry *VarAlloc();

/* XXX: Defined in detect.c */
ListHead *CreateRuleType(char *, int, int, ListHead *);
RuleListNode *addNodeToOrderedList(RuleListNode *, RuleListNode *);

void ProcessAlertFileOption(char *);
char *ProcessFileOption(char *);
void ParseConfig(char *);
void ParseRuleTypeDeclaration(FILE*, char *);
void ParseDeclaredRuleType(char *);
/*void ParseClassificationConfig(char *); */
char *ReadLine(FILE *);
int checkKeyowrd(char *);

#endif /* __PARSER_H__ */

