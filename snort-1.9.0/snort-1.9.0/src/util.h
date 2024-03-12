#ifndef __UTIL_H__
#define __UTIL_H__

#define TIMEBUF_SIZE 26

#ifndef WIN32
#include <sys/time.h>
#endif /* !WIN32 */

#ifndef HAVE_STRLCAT
#include "strlcatu.h"
#endif

#ifndef HAVE_STRLCPY
#include "strlcpyu.h"
#endif

extern u_long netmasks[33];

int DisplayBanner();
void GetTime(char *);
int gmt2local(time_t);
void ts_print(register const struct timeval *, char *);
char *copy_argv(char **);
int strip(char *);
float CalcPct(float, float);
void ReadPacketsFromFile();
void GenHomenet(char *);
void InitNetmasks();
void InitBinFrag();
void GoDaemon();
void SanityChecks();
char *read_infile(char *);
void InitProtoNames();
void CleanupProtoNames();
void PrintError(char *);
void ErrorMessage(const char *, ...);
void LogMessage(const char *, ...);
void FatalError(const char *, ...);
void FatalPrintError(char *);
void CreatePidFile(char *);
void SetUidGid(void);
void SigUSR1Wrap(int);
void DropStats(int);
void GenObfuscationMask(char *);
void FreeToks(char **, int);

#endif /*__UTIL_H__*/
