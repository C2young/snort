
#ifndef __CONFIG_H__
#define __CONFIG_H__

/* config.h.  Generated automatically by configure.  */
/* config.h.in.  Generated automatically from configure.in by autoheader.  */

/* Define if on AIX 3.
   System headers sometimes define this.
   We just want to avoid a redefinition error message.  */
#ifndef _ALL_SOURCE
/* #undef _ALL_SOURCE */
#endif

/* Define if you have the ANSI C header files.  */
/* #undef STDC_HEADERS */

/* Define if your processor stores words with the most significant
   byte first (like Motorola and SPARC, unlike Intel and VAX).  */
#define WORDS_LITTLEENDIAN 1

/* $Id: config.h,v 1.10 2002/08/18 16:16:31 chrisgreen Exp $ */
#define PACKAGE "snort"
/* #undef BSDI */
/* #undef FREEBSD */
/* #undef IRIX */
/* #undef AIX */
/* #undef LINUX */
/* #undef OPENBSD */
#define WIN32 1
/* #undef PCAP_TIMEOUT_IGNORED */
/* #undef SOLARIS */
/* #undef STUPID_SOLARIS_CHECKSUM_BUG */
/* #undef SUNOS */
/* #undef HPUX */
/* #undef OSF1 */
/* #undef WORDS_MUSTALIGN */
/* #undef ENABLE_POSTGRESQL */
/* #undef u_int8_t */
/* #undef u_int16_t */
/* #undef u_int32_t */
/* #undef NEED_DECL_PRINTF */
/* #undef NEED_DECL_FPRINTF */
/* #undef NEED_DECL_SYSLOG */
/* #undef NEED_DECL_PUTS */
/* #undef NEED_DECL_PUTC */
/* #undef NEED_DECL_FPUTS */
/* #undef NEED_DECL_FPUTC */
/* #undef NEED_DECL_FOPEN */
/* #undef NEED_DECL_FCLOSE */
/* #undef NEED_DECL_FWRITE */
/* #undef NEED_DECL_FFLUSH */
/* #undef NEED_DECL_GETOPT */
/* #undef NEED_DECL_BZERO */
/* #undef NEED_DECL_BCOPY */
/* #undef NEED_DECL_MEMSET */
/* #undef NEED_DECL_STRTOL */
/* #undef NEED_DECL_STRCASECMP */
/* #undef NEED_DECL_STRNCASECMP */
/* #undef NEED_DECL_STRERROR */
/* #undef NEED_DECL_PERROR */
/* #undef NEED_DECL_SOCKET */
/* #undef NEED_DECL_SENDTO */
/* #undef NEED_DECL_VSNPRINTF */
/* #undef NEED_DECL_STRTOUL */
#define ERRLIST_PREDEFINED 1

/* Define if you have the snprintf function.  */
#define HAVE_SNPRINTF 1

/* Define if you have the strerror function.  */
#define HAVE_STRERROR 1

/* Define if you have the strlcat function.  */
/* #undef HAVE_STRLCAT */

/* Define if you have the strlcpy function.  */
/* #undef HAVE_STRLCPY */

/* Define if you have the strtoul function.  */
/* #undef HAVE_STRTOUL */

/* Define if you have the vsnprintf function.  */
/* #undef HAVE_VSNPRINTF */

/* Define if you have the <paths.h> header file.  */
/* #undef HAVE_PATHS_H */

/* Define if you have the <stdlib.h> header file.  */
#define HAVE_STDLIB_H 1

/* Define if you have the <string.h> header file.  */
#define HAVE_STRING_H 1

/* Define if you have the <strings.h> header file.  */
/* #undef HAVE_STRINGS_H */

/* Define if you have the <sys/sockio.h> header file.  */
/* #undef HAVE_SYS_SOCKIO_H */

/* Define if you have the <unistd.h> header file.  */
#define HAVE_UNISTD_H 1

/* Define if you have the m library (-lm).  */
/* #undef HAVE_LIBM */

/* Define if you have the nsl library (-lnsl).  */
/* #undef HAVE_LIBNSL */

/* Define if you have the pcap library (-lpcap).  */
#define HAVE_LIBPCAP 1

/* Define if you have the socket library (-lsocket).  */
/* #undef HAVE_LIBSOCKET */

/* Define if you have the z library (-lz).  */
/* #undef HAVE_LIBZ */

/* Name of package */
#define PACKAGE "snort"

/* Version number of package */
#ifdef ENABLE_ODBC
	#define VERSION_ENABLE_ODBC "-ODBC"
#else
    #define VERSION_ENABLE_ODBC
#endif

#ifdef ENABLE_MYSQL
	#define VERSION_ENABLE_MYSQL "-MySQL"
#else
    #define VERSION_ENABLE_MYSQL
#endif

#ifdef ENABLE_MSSQL
	#define VERSION_ENABLE_MSSQL "-MSSQL"
#else
    #define VERSION_ENABLE_MSSQL
#endif

#ifdef ENABLE_RESPONSE
    #define VERSION_ENABLE_RESPONSE "-FlexRESP"
#else
    #define VERSION_ENABLE_RESPONSE
#endif
 
#ifdef USE_SF_STATS
    #define VERSION_USE_SF_STATS "-SFStats"
#else
    #define VERSION_USE_SF_STATS
#endif


#ifdef DEBUG
	#define VERSION_DEBUG " [DEBUG] "
#else
    #define VERSION_DEBUG
#endif

#define VERSION "1.9.0beta6"VERSION_ENABLE_ODBC""VERSION_ENABLE_MYSQL""VERSION_ENABLE_MSSQL""VERSION_ENABLE_RESPONSE"-WIN32"VERSION_DEBUG


#define u_int8_t   unsigned char
#define u_int16_t  unsigned short

#define IFNAMSIZ   255


#include <winsock2.h>
#include <windows.h>
#pragma warning( disable : 4028 )
#include <io.h>
#include <process.h>
#pragma warning( default : 4028 )
#include <sys/timeb.h>
#include <direct.h>
#include <getopt.h>
typedef int            pid_t;
#include "win32/WIN32-Includes/rpc/types.h"

#undef interface


// #define SIGKILL                  9       /* kill (cannot be caught or ignored) */
#define SIGQUIT                  3       /* quit */
#define SIGHUP                   1       /* hangup */
#define SIGUSR1 30               /* user defined signal 1 */
#define SIGUSR2 31               /* user defined signal 2 */
#define SIGPIPE 13               /* write on a pipe with no one to read it */
// #define EEXIST                   17              /* File exists */
#define W_OK                     0x02    /* test for write permission */
#define R_OK                     0x04    /* test for read permission */
#define S_ISDIR(x)               (((x) & 0170000) == 0040000)    /* directory */
#define S_IRWXU                  0000700                 /* RWX mask for owner */
#define S_IRWXG                  0000070                 /* RWX mask for group */
#define S_IROTH                  0000004                 /* R for other */
#define S_IXOTH                  0000001                 /* X for other */

#define bcopy(src, dst, count)   memcpy((void *)dst, (const void *)src, (size_t) count)
#define bzero(addr, count)       memset((addr), 0, (count))
#define index                    strchr
#define mkdir(x, y)              _mkdir(x)
#define snprintf                 _snprintf
#define strncasecmp              strnicmp
#define strcasecmp               stricmp
#define vsnprintf                _vsnprintf
#define IXDR_GET_LONG(buf)       ((long)ntohl((u_long)*(buf)++))
#define IXDR_GET_ENUM(buf, t)    ((t)IXDR_GET_LONG(buf))
#define RPC_MSG_VERSION          ((u_long) 2)

enum msg_type {
	CALL=0,
	REPLY=1
};



struct timezone {
        int     tz_minuteswest; /* minutes west of Greenwich */
        int     tz_dsttime;     /* type of dst correction */
};

/*
 * Interface request structure used for socket
 * ioctl's.  All interface ioctl's must have parameter
 * definitions which begin with ifr_name.  The
 * remainder may be interface specific.
 */
struct  ifreq {
        char    ifr_name[128];             /* if name, e.g. "en0" */
        union {
                struct  sockaddr ifru_addr;
                struct  sockaddr ifru_dstaddr;
                struct  sockaddr ifru_broadaddr;
                short   ifru_flags;
                int     ifru_metric;
                caddr_t ifru_data;
        } ifr_ifru;
#define ifr_addr        ifr_ifru.ifru_addr      /* address */
#define ifr_dstaddr     ifr_ifru.ifru_dstaddr   /* other end of p-to-p link */
#define ifr_broadaddr   ifr_ifru.ifru_broadaddr /* broadcast address */
#define ifr_flags       ifr_ifru.ifru_flags     /* flags */
#define ifr_metric      ifr_ifru.ifru_metric    /* metric */
#define ifr_mtu         ifr_ifru.ifru_metric    /* mtu (overload) */
#define ifr_media       ifr_ifru.ifru_metric    /* media options (overload) */
#define ifr_data        ifr_ifru.ifru_data      /* for use by interface */
};


#define RUSAGE_SELF       0     /* calling process */
#define RUSAGE_CHILDREN  -1     /* terminated child processes */
struct rusage
{
    struct  timeval ru_utime;/* user time used */
    struct  timeval ru_stime;/* system time used */
    long    ru_maxrss;
    long    ru_ixrss;     /* integral shared memory size */
    long    ru_idrss;     /* integral unshared data " */
    long    ru_isrss;     /* integral unshared stack " */
    long    ru_minflt;    /* page reclaims */
    long    ru_majflt;    /* page faults */
    long    ru_nswap;     /* swaps */
    long    ru_inblock;   /* block input operations */
    long    ru_oublock;   /* block output operations */
    long    ru_msgsnd;    /* messages sent */
    long    ru_msgrcv;    /* messages received */
    long    ru_nsignals;  /* signals received */
    long    ru_nvcsw;     /* voluntary context switches */
    long    ru_nivcsw;    /* involuntary " */
};
int getrusage (int __who, struct rusage *__rusage);

int   gettimeofday(struct timeval *,struct timezone *);
void *GetAdapterFromList(void *, int);
char *print_interface(char *);
void  PrintDeviceList(const char *);
int   init_winsock(void);


#if defined(ENABLE_WIN32_SERVICE)
    #define SERVICE_CMDLINE_PARAM            "/SERVICE"
    #define SERVICE_INSTALL_CMDLINE_PARAM    "/INSTALL"
    #define SERVICE_UNINSTALL_CMDLINE_PARAM  "/UNINSTALL"
    #define SERVICE_SHOW_CMDLINE_PARAM       "/SHOW"

    int   SnortServiceMain(int argc, char* argv[]);
#endif  /* ENABLE_WIN32_SERVICE */


#endif __CONFIG_H__

