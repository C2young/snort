#ifndef __SNPRINTF_H__
#define __SNPRINTF_H__

#ifndef HAVE_SNPRINTF

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <stdio.h>
#include <sys/types.h>
#include <string.h>

#ifdef __STDC__

#include <stdarg.h>

# define VA_LOCAL_DECL  va_list ap;
# define VA_START(f)    va_start(ap, f)
# define VA_END         va_end(ap)

#else /* __STDC__ */

#ifndef WIN32
#include <varargs.h>
#endif  /* WIN32 */

# define VA_LOCAL_DECL  va_list ap;
# define VA_START(f)    va_start(ap)
# define VA_END         va_end(ap)

#endif /* __STDC__ */

#ifndef __P
#include "cdefs.h"
#endif /* ! __P */

#ifndef QUAD_T
# define QUAD_T unsigned long
#endif /* ! QUAD_T */



#define tTd(flag, level)        (tTdvect[flag] >= (u_char)level)
#define MAXSHORTSTR  203             /* max short string length */

u_char   tTdvect[100];   /* trace vector */

int snprintf(char *, size_t , const char *, ...);
#ifndef HAVE_VSNPRINTF
int vsnprintf(char *, size_t, const char *, va_list);
#endif /* HAVE_VSNPRINTF */
char *shortenstring(register const char *, int);


#endif /* HAVE_SNPRINTF */
#endif /* __SNPRINTF_H__ */
