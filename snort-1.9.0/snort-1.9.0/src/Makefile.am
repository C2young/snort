## $Id: Makefile.am,v 1.14 2002/08/26 21:10:07 roesch Exp $
AUTOMAKE_OPTIONS=foreign no-dependencies

bin_PROGRAMS = snort

snort_SOURCES = cdefs.h \
event.h \
fatal.h \
generators.h \
prototypes.h \
plugin_enum.h \
rules.h \
sys_include.h \
checksum.h \
codes.c codes.h \
debug.c debug.h \
decode.c decode.h \
log.c log.h \
mstring.c mstring.h \
parser.c parser.h \
plugbase.c plugbase.h \
snort.c snort.h \
snprintf.c snprintf.h \
strlcatu.c strlcatu.h \
strlcpyu.c strlcpyu.h \
tag.c tag.h \
ubi_BinTree.c ubi_BinTree.h \
ubi_SplayTree.c ubi_SplayTree.h \
util.c util.h \
detect.c detect.h \
substr.c substr.h \
trie.c trie.h \
signature.c signature.h \
mempool.c mempool.h \
sf_sdlist.c sf_sdlist.h \
perf.c perf.h \
perf-flow.c perf-flow.h \
perf-base.c perf-base.h \
perf-event.c perf-event.h \
threshold.c threshold.h

snort_LDADD = output-plugins/libspo.a \
detection-plugins/libspd.a preprocessors/libspp.a 

SUBDIRS = win32 output-plugins detection-plugins preprocessors

INCLUDES = @INCLUDES@
