# Microsoft Developer Studio Generated NMAKE File, Based on snort.dsp
!IF "$(CFG)" == ""
CFG=snort - Win32 StdDB FlexResp Release
!MESSAGE No configuration specified. Defaulting to snort - Win32 StdDB FlexResp Release.
!ENDIF 

!IF "$(CFG)" != "snort - Win32 StdDB Debug" && "$(CFG)" != "snort - Win32 StdDB Release" && "$(CFG)" != "snort - Win32 StdDB FlexResp Debug" && "$(CFG)" != "snort - Win32 StdDB FlexResp Release" && "$(CFG)" != "snort - Win32 StdDB FlexResp Service Debug" && "$(CFG)" != "snort - Win32 StdDB FlexResp Service Release" && "$(CFG)" != "snort - Win32 StdDB MSSQL Debug" && "$(CFG)" != "snort - Win32 StdDB MSSQL Release" && "$(CFG)" != "snort - Win32 StdDB MSSQL Service Debug" && "$(CFG)" != "snort - Win32 StdDB MSSQL Service Release" && "$(CFG)" != "snort - Win32 StdDB MSSQL FlexResp Debug" && "$(CFG)" != "snort - Win32 StdDB MSSQL FlexResp Release" && "$(CFG)" != "snort - Win32 StdDB MSSQL FlexResp Service Debug" && "$(CFG)" != "snort - Win32 StdDB MSSQL FlexResp Service Release" && "$(CFG)" != "snort - Win32 StdDB Service Debug" && "$(CFG)" != "snort - Win32 StdDB Service Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "snort.mak" CFG="snort - Win32 StdDB FlexResp Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "snort - Win32 StdDB Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB Release" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB FlexResp Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB FlexResp Release" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB FlexResp Service Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB FlexResp Service Release" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB MSSQL Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB MSSQL Release" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB MSSQL Service Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB MSSQL Service Release" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB MSSQL FlexResp Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB MSSQL FlexResp Release" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB MSSQL FlexResp Service Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB MSSQL FlexResp Service Release" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB Service Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "snort - Win32 StdDB Service Release" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"

OUTDIR=.\snort___Win32_StdDB_Debug
INTDIR=.\snort___Win32_StdDB_Debug
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_Debug
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(OUTDIR)\snort.exe"
	-@erase "$(OUTDIR)\snort.ilk"
	-@erase "$(OUTDIR)\snort.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "_DEBUG" /D "DEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /Fp"$(INTDIR)\snort.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib mysqlclient.lib odbc32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\snort.pdb" /debug /machine:I386 /out:"$(OUTDIR)\snort.exe" /pdbtype:sept /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"

OUTDIR=.\snort___Win32_StdDB_Release
INTDIR=.\snort___Win32_StdDB_Release
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_Release
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe" "$(OUTDIR)\snort.bsc"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\checksum.sbr"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\codes.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\decode.sbr"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\detect.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\mstring.sbr"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\plugbase.sbr"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snort.sbr"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\snprintf.sbr"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_clientserver.sbr"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_dsize_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.sbr"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.sbr"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.sbr"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_proto.sbr"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.sbr"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.sbr"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.sbr"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_pattern_match.sbr"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_priority.sbr"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_react.sbr"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_reference.sbr"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_respond.sbr"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_rpc_check.sbr"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_session.sbr"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.sbr"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.sbr"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_fast.sbr"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_full.sbr"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_smb.sbr"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.sbr"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.sbr"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_csv.sbr"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_database.sbr"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_idmef.sbr"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_ascii.sbr"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_null.sbr"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.sbr"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.sbr"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_unified.sbr"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spo_xml.sbr"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_arpspoof.sbr"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_asn1.sbr"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_bo.sbr"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_conversation.sbr"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_fnord.sbr"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_frag2.sbr"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_http_decode.sbr"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan.sbr"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_portscan2.sbr"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.sbr"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_stream4.sbr"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.sbr"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcatu.sbr"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\strlcpyu.sbr"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\substr.sbr"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\syslog.sbr"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\tag.sbr"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\trie.sbr"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_BinTree.sbr"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(INTDIR)\win32_service.sbr"
	-@erase "$(OUTDIR)\snort.bsc"
	-@erase "$(OUTDIR)\snort.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\snort.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\checksum.sbr" \
	"$(INTDIR)\codes.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\decode.sbr" \
	"$(INTDIR)\detect.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mstring.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\plugbase.sbr" \
	"$(INTDIR)\snort.sbr" \
	"$(INTDIR)\snprintf.sbr" \
	"$(INTDIR)\strlcatu.sbr" \
	"$(INTDIR)\strlcpyu.sbr" \
	"$(INTDIR)\substr.sbr" \
	"$(INTDIR)\tag.sbr" \
	"$(INTDIR)\trie.sbr" \
	"$(INTDIR)\ubi_BinTree.sbr" \
	"$(INTDIR)\ubi_SplayTree.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\syslog.sbr" \
	"$(INTDIR)\win32_service.sbr" \
	"$(INTDIR)\sp_clientserver.sbr" \
	"$(INTDIR)\sp_dsize_check.sbr" \
	"$(INTDIR)\sp_icmp_code_check.sbr" \
	"$(INTDIR)\sp_icmp_id_check.sbr" \
	"$(INTDIR)\sp_icmp_seq_check.sbr" \
	"$(INTDIR)\sp_icmp_type_check.sbr" \
	"$(INTDIR)\sp_ip_fragbits.sbr" \
	"$(INTDIR)\sp_ip_id_check.sbr" \
	"$(INTDIR)\sp_ip_proto.sbr" \
	"$(INTDIR)\sp_ip_same_check.sbr" \
	"$(INTDIR)\sp_ip_tos_check.sbr" \
	"$(INTDIR)\sp_ipoption_check.sbr" \
	"$(INTDIR)\sp_pattern_match.sbr" \
	"$(INTDIR)\sp_priority.sbr" \
	"$(INTDIR)\sp_react.sbr" \
	"$(INTDIR)\sp_reference.sbr" \
	"$(INTDIR)\sp_respond.sbr" \
	"$(INTDIR)\sp_rpc_check.sbr" \
	"$(INTDIR)\sp_session.sbr" \
	"$(INTDIR)\sp_tcp_ack_check.sbr" \
	"$(INTDIR)\sp_tcp_flag_check.sbr" \
	"$(INTDIR)\sp_tcp_seq_check.sbr" \
	"$(INTDIR)\sp_tcp_win_check.sbr" \
	"$(INTDIR)\sp_ttl_check.sbr" \
	"$(INTDIR)\spo_alert_fast.sbr" \
	"$(INTDIR)\spo_alert_full.sbr" \
	"$(INTDIR)\spo_alert_smb.sbr" \
	"$(INTDIR)\spo_alert_syslog.sbr" \
	"$(INTDIR)\spo_alert_unixsock.sbr" \
	"$(INTDIR)\spo_csv.sbr" \
	"$(INTDIR)\spo_database.sbr" \
	"$(INTDIR)\spo_idmef.sbr" \
	"$(INTDIR)\spo_log_ascii.sbr" \
	"$(INTDIR)\spo_log_null.sbr" \
	"$(INTDIR)\spo_log_tcpdump.sbr" \
	"$(INTDIR)\spo_SnmpTrap.sbr" \
	"$(INTDIR)\spo_unified.sbr" \
	"$(INTDIR)\spo_xml.sbr" \
	"$(INTDIR)\spp_arpspoof.sbr" \
	"$(INTDIR)\spp_asn1.sbr" \
	"$(INTDIR)\spp_bo.sbr" \
	"$(INTDIR)\spp_conversation.sbr" \
	"$(INTDIR)\spp_fnord.sbr" \
	"$(INTDIR)\spp_frag2.sbr" \
	"$(INTDIR)\spp_http_decode.sbr" \
	"$(INTDIR)\spp_portscan.sbr" \
	"$(INTDIR)\spp_portscan2.sbr" \
	"$(INTDIR)\spp_rpc_decode.sbr" \
	"$(INTDIR)\spp_stream4.sbr" \
	"$(INTDIR)\spp_telnet_negotiation.sbr"

"$(OUTDIR)\snort.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib mysqlclient.lib odbc32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\snort.pdb" /machine:I386 /out:"$(OUTDIR)\snort.exe" /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"

OUTDIR=.\snort___Win32_StdDB_FlexResp_Debug
INTDIR=.\snort___Win32_StdDB_FlexResp_Debug
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_FlexResp_Debug
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(OUTDIR)\snort.exe"
	-@erase "$(OUTDIR)\snort.ilk"
	-@erase "$(OUTDIR)\snort.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\Win32-Includes\libnet" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "_DEBUG" /D "DEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_RESPONSE" /Fp"$(INTDIR)\snort.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib mysqlclient.lib libnetnt.lib odbc32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\snort.pdb" /debug /machine:I386 /out:"$(OUTDIR)\snort.exe" /pdbtype:sept /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" /libpath:"..\Win32-Libraries\libnet" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"

OUTDIR=.\snort___Win32_StdDB_FlexResp_Release
INTDIR=.\snort___Win32_StdDB_FlexResp_Release
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_FlexResp_Release
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(OUTDIR)\snort.exe"
	-@erase "$(OUTDIR)\snort.ilk"
	-@erase "$(OUTDIR)\snort.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\Win32-Includes\libnet" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "_DEBUG" /D "DEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_RESPONSE" /Fp"$(INTDIR)\snort.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib mysqlclient.lib libnetnt.lib odbc32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\snort.pdb" /debug /machine:I386 /nodefaultlib:"libcmt.lib" /out:"$(OUTDIR)\snort.exe" /pdbtype:sept /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" /libpath:"..\Win32-Libraries\libnet" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"

OUTDIR=.\snort___Win32_StdDB_FlexResp_Service_Debug
INTDIR=.\snort___Win32_StdDB_FlexResp_Service_Debug
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_FlexResp_Service_Debug
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(OUTDIR)\snort.exe"
	-@erase "$(OUTDIR)\snort.ilk"
	-@erase "$(OUTDIR)\snort.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\Win32-Includes\libnet" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "_DEBUG" /D "DEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_RESPONSE" /D "ENABLE_WIN32_SERVICE" /Fp"$(INTDIR)\snort.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib mysqlclient.lib libnetnt.lib odbc32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\snort.pdb" /debug /machine:I386 /out:"$(OUTDIR)\snort.exe" /pdbtype:sept /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" /libpath:"..\Win32-Libraries\libnet" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"

OUTDIR=.\snort___Win32_StdDB_FlexResp_Service_Release
INTDIR=.\snort___Win32_StdDB_FlexResp_Service_Release
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_FlexResp_Service_Release
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(OUTDIR)\snort.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\Win32-Includes\libnet" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_RESPONSE" /D "ENABLE_WIN32_SERVICE" /Fp"$(INTDIR)\snort.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib mysqlclient.lib libnetnt.lib odbc32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\snort.pdb" /machine:I386 /out:"$(OUTDIR)\snort.exe" /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" /libpath:"..\Win32-Libraries\libnet" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"

OUTDIR=.\snort___Win32_StdDB_MSSQL_Debug
INTDIR=.\snort___Win32_StdDB_MSSQL_Debug
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_MSSQL_Debug
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe" "$(OUTDIR)\snort.bsc"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\checksum.sbr"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\codes.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\decode.sbr"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\detect.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\mstring.sbr"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\plugbase.sbr"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snort.sbr"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\snprintf.sbr"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_clientserver.sbr"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_dsize_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.sbr"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.sbr"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.sbr"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_proto.sbr"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.sbr"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.sbr"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.sbr"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_pattern_match.sbr"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_priority.sbr"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_react.sbr"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_reference.sbr"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_respond.sbr"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_rpc_check.sbr"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_session.sbr"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.sbr"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.sbr"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_fast.sbr"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_full.sbr"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_smb.sbr"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.sbr"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.sbr"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_csv.sbr"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_database.sbr"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_idmef.sbr"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_ascii.sbr"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_null.sbr"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.sbr"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.sbr"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_unified.sbr"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spo_xml.sbr"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_arpspoof.sbr"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_asn1.sbr"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_bo.sbr"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_conversation.sbr"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_fnord.sbr"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_frag2.sbr"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_http_decode.sbr"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan.sbr"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_portscan2.sbr"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.sbr"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_stream4.sbr"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.sbr"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcatu.sbr"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\strlcpyu.sbr"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\substr.sbr"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\syslog.sbr"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\tag.sbr"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\trie.sbr"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_BinTree.sbr"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(INTDIR)\win32_service.sbr"
	-@erase "$(OUTDIR)\snort.bsc"
	-@erase "$(OUTDIR)\snort.exe"
	-@erase "$(OUTDIR)\snort.ilk"
	-@erase "$(OUTDIR)\snort.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "_DEBUG" /D "DEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MSSQL" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\snort.pch" /YX"snort.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\checksum.sbr" \
	"$(INTDIR)\codes.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\decode.sbr" \
	"$(INTDIR)\detect.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mstring.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\plugbase.sbr" \
	"$(INTDIR)\snort.sbr" \
	"$(INTDIR)\snprintf.sbr" \
	"$(INTDIR)\strlcatu.sbr" \
	"$(INTDIR)\strlcpyu.sbr" \
	"$(INTDIR)\substr.sbr" \
	"$(INTDIR)\tag.sbr" \
	"$(INTDIR)\trie.sbr" \
	"$(INTDIR)\ubi_BinTree.sbr" \
	"$(INTDIR)\ubi_SplayTree.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\syslog.sbr" \
	"$(INTDIR)\win32_service.sbr" \
	"$(INTDIR)\sp_clientserver.sbr" \
	"$(INTDIR)\sp_dsize_check.sbr" \
	"$(INTDIR)\sp_icmp_code_check.sbr" \
	"$(INTDIR)\sp_icmp_id_check.sbr" \
	"$(INTDIR)\sp_icmp_seq_check.sbr" \
	"$(INTDIR)\sp_icmp_type_check.sbr" \
	"$(INTDIR)\sp_ip_fragbits.sbr" \
	"$(INTDIR)\sp_ip_id_check.sbr" \
	"$(INTDIR)\sp_ip_proto.sbr" \
	"$(INTDIR)\sp_ip_same_check.sbr" \
	"$(INTDIR)\sp_ip_tos_check.sbr" \
	"$(INTDIR)\sp_ipoption_check.sbr" \
	"$(INTDIR)\sp_pattern_match.sbr" \
	"$(INTDIR)\sp_priority.sbr" \
	"$(INTDIR)\sp_react.sbr" \
	"$(INTDIR)\sp_reference.sbr" \
	"$(INTDIR)\sp_respond.sbr" \
	"$(INTDIR)\sp_rpc_check.sbr" \
	"$(INTDIR)\sp_session.sbr" \
	"$(INTDIR)\sp_tcp_ack_check.sbr" \
	"$(INTDIR)\sp_tcp_flag_check.sbr" \
	"$(INTDIR)\sp_tcp_seq_check.sbr" \
	"$(INTDIR)\sp_tcp_win_check.sbr" \
	"$(INTDIR)\sp_ttl_check.sbr" \
	"$(INTDIR)\spo_alert_fast.sbr" \
	"$(INTDIR)\spo_alert_full.sbr" \
	"$(INTDIR)\spo_alert_smb.sbr" \
	"$(INTDIR)\spo_alert_syslog.sbr" \
	"$(INTDIR)\spo_alert_unixsock.sbr" \
	"$(INTDIR)\spo_csv.sbr" \
	"$(INTDIR)\spo_database.sbr" \
	"$(INTDIR)\spo_idmef.sbr" \
	"$(INTDIR)\spo_log_ascii.sbr" \
	"$(INTDIR)\spo_log_null.sbr" \
	"$(INTDIR)\spo_log_tcpdump.sbr" \
	"$(INTDIR)\spo_SnmpTrap.sbr" \
	"$(INTDIR)\spo_unified.sbr" \
	"$(INTDIR)\spo_xml.sbr" \
	"$(INTDIR)\spp_arpspoof.sbr" \
	"$(INTDIR)\spp_asn1.sbr" \
	"$(INTDIR)\spp_bo.sbr" \
	"$(INTDIR)\spp_conversation.sbr" \
	"$(INTDIR)\spp_fnord.sbr" \
	"$(INTDIR)\spp_frag2.sbr" \
	"$(INTDIR)\spp_http_decode.sbr" \
	"$(INTDIR)\spp_portscan.sbr" \
	"$(INTDIR)\spp_portscan2.sbr" \
	"$(INTDIR)\spp_rpc_decode.sbr" \
	"$(INTDIR)\spp_stream4.sbr" \
	"$(INTDIR)\spp_telnet_negotiation.sbr"

"$(OUTDIR)\snort.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib Ntwdblib.lib mysqlclient.lib odbc32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\snort.pdb" /debug /machine:I386 /out:"$(OUTDIR)\snort.exe" /pdbtype:sept /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"

OUTDIR=.\snort___Win32_StdDB_MSSQL_Release
INTDIR=.\snort___Win32_StdDB_MSSQL_Release
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_MSSQL_Release
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe" "$(OUTDIR)\snort.bsc"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\checksum.sbr"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\codes.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\decode.sbr"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\detect.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\mstring.sbr"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\plugbase.sbr"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snort.sbr"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\snprintf.sbr"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_clientserver.sbr"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_dsize_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.sbr"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.sbr"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.sbr"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_proto.sbr"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.sbr"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.sbr"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.sbr"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_pattern_match.sbr"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_priority.sbr"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_react.sbr"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_reference.sbr"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_respond.sbr"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_rpc_check.sbr"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_session.sbr"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.sbr"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.sbr"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_fast.sbr"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_full.sbr"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_smb.sbr"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.sbr"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.sbr"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_csv.sbr"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_database.sbr"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_idmef.sbr"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_ascii.sbr"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_null.sbr"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.sbr"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.sbr"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_unified.sbr"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spo_xml.sbr"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_arpspoof.sbr"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_asn1.sbr"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_bo.sbr"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_conversation.sbr"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_fnord.sbr"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_frag2.sbr"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_http_decode.sbr"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan.sbr"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_portscan2.sbr"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.sbr"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_stream4.sbr"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.sbr"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcatu.sbr"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\strlcpyu.sbr"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\substr.sbr"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\syslog.sbr"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\tag.sbr"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\trie.sbr"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_BinTree.sbr"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(INTDIR)\win32_service.sbr"
	-@erase "$(OUTDIR)\snort.bsc"
	-@erase "$(OUTDIR)\snort.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MSSQL" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\snort.pch" /YX"snort.pch" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\checksum.sbr" \
	"$(INTDIR)\codes.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\decode.sbr" \
	"$(INTDIR)\detect.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mstring.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\plugbase.sbr" \
	"$(INTDIR)\snort.sbr" \
	"$(INTDIR)\snprintf.sbr" \
	"$(INTDIR)\strlcatu.sbr" \
	"$(INTDIR)\strlcpyu.sbr" \
	"$(INTDIR)\substr.sbr" \
	"$(INTDIR)\tag.sbr" \
	"$(INTDIR)\trie.sbr" \
	"$(INTDIR)\ubi_BinTree.sbr" \
	"$(INTDIR)\ubi_SplayTree.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\syslog.sbr" \
	"$(INTDIR)\win32_service.sbr" \
	"$(INTDIR)\sp_clientserver.sbr" \
	"$(INTDIR)\sp_dsize_check.sbr" \
	"$(INTDIR)\sp_icmp_code_check.sbr" \
	"$(INTDIR)\sp_icmp_id_check.sbr" \
	"$(INTDIR)\sp_icmp_seq_check.sbr" \
	"$(INTDIR)\sp_icmp_type_check.sbr" \
	"$(INTDIR)\sp_ip_fragbits.sbr" \
	"$(INTDIR)\sp_ip_id_check.sbr" \
	"$(INTDIR)\sp_ip_proto.sbr" \
	"$(INTDIR)\sp_ip_same_check.sbr" \
	"$(INTDIR)\sp_ip_tos_check.sbr" \
	"$(INTDIR)\sp_ipoption_check.sbr" \
	"$(INTDIR)\sp_pattern_match.sbr" \
	"$(INTDIR)\sp_priority.sbr" \
	"$(INTDIR)\sp_react.sbr" \
	"$(INTDIR)\sp_reference.sbr" \
	"$(INTDIR)\sp_respond.sbr" \
	"$(INTDIR)\sp_rpc_check.sbr" \
	"$(INTDIR)\sp_session.sbr" \
	"$(INTDIR)\sp_tcp_ack_check.sbr" \
	"$(INTDIR)\sp_tcp_flag_check.sbr" \
	"$(INTDIR)\sp_tcp_seq_check.sbr" \
	"$(INTDIR)\sp_tcp_win_check.sbr" \
	"$(INTDIR)\sp_ttl_check.sbr" \
	"$(INTDIR)\spo_alert_fast.sbr" \
	"$(INTDIR)\spo_alert_full.sbr" \
	"$(INTDIR)\spo_alert_smb.sbr" \
	"$(INTDIR)\spo_alert_syslog.sbr" \
	"$(INTDIR)\spo_alert_unixsock.sbr" \
	"$(INTDIR)\spo_csv.sbr" \
	"$(INTDIR)\spo_database.sbr" \
	"$(INTDIR)\spo_idmef.sbr" \
	"$(INTDIR)\spo_log_ascii.sbr" \
	"$(INTDIR)\spo_log_null.sbr" \
	"$(INTDIR)\spo_log_tcpdump.sbr" \
	"$(INTDIR)\spo_SnmpTrap.sbr" \
	"$(INTDIR)\spo_unified.sbr" \
	"$(INTDIR)\spo_xml.sbr" \
	"$(INTDIR)\spp_arpspoof.sbr" \
	"$(INTDIR)\spp_asn1.sbr" \
	"$(INTDIR)\spp_bo.sbr" \
	"$(INTDIR)\spp_conversation.sbr" \
	"$(INTDIR)\spp_fnord.sbr" \
	"$(INTDIR)\spp_frag2.sbr" \
	"$(INTDIR)\spp_http_decode.sbr" \
	"$(INTDIR)\spp_portscan.sbr" \
	"$(INTDIR)\spp_portscan2.sbr" \
	"$(INTDIR)\spp_rpc_decode.sbr" \
	"$(INTDIR)\spp_stream4.sbr" \
	"$(INTDIR)\spp_telnet_negotiation.sbr"

"$(OUTDIR)\snort.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib Ntwdblib.lib mysqlclient.lib odbc32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\snort.pdb" /machine:I386 /out:"$(OUTDIR)\snort.exe" /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"

OUTDIR=.\snort___Win32_StdDB_MSSQL_Service_Debug
INTDIR=.\snort___Win32_StdDB_MSSQL_Service_Debug
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_MSSQL_Service_Debug
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe" "$(OUTDIR)\snort.bsc"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\checksum.sbr"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\codes.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\decode.sbr"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\detect.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\mstring.sbr"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\plugbase.sbr"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snort.sbr"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\snprintf.sbr"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_clientserver.sbr"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_dsize_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.sbr"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.sbr"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.sbr"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_proto.sbr"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.sbr"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.sbr"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.sbr"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_pattern_match.sbr"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_priority.sbr"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_react.sbr"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_reference.sbr"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_respond.sbr"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_rpc_check.sbr"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_session.sbr"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.sbr"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.sbr"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_fast.sbr"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_full.sbr"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_smb.sbr"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.sbr"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.sbr"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_csv.sbr"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_database.sbr"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_idmef.sbr"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_ascii.sbr"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_null.sbr"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.sbr"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.sbr"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_unified.sbr"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spo_xml.sbr"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_arpspoof.sbr"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_asn1.sbr"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_bo.sbr"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_conversation.sbr"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_fnord.sbr"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_frag2.sbr"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_http_decode.sbr"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan.sbr"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_portscan2.sbr"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.sbr"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_stream4.sbr"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.sbr"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcatu.sbr"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\strlcpyu.sbr"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\substr.sbr"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\syslog.sbr"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\tag.sbr"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\trie.sbr"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_BinTree.sbr"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(INTDIR)\win32_service.sbr"
	-@erase "$(OUTDIR)\snort.bsc"
	-@erase "$(OUTDIR)\snort.exe"
	-@erase "$(OUTDIR)\snort.ilk"
	-@erase "$(OUTDIR)\snort.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "_DEBUG" /D "DEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MSSQL" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_WIN32_SERVICE" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\snort.pch" /YX"snort.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\checksum.sbr" \
	"$(INTDIR)\codes.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\decode.sbr" \
	"$(INTDIR)\detect.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mstring.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\plugbase.sbr" \
	"$(INTDIR)\snort.sbr" \
	"$(INTDIR)\snprintf.sbr" \
	"$(INTDIR)\strlcatu.sbr" \
	"$(INTDIR)\strlcpyu.sbr" \
	"$(INTDIR)\substr.sbr" \
	"$(INTDIR)\tag.sbr" \
	"$(INTDIR)\trie.sbr" \
	"$(INTDIR)\ubi_BinTree.sbr" \
	"$(INTDIR)\ubi_SplayTree.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\syslog.sbr" \
	"$(INTDIR)\win32_service.sbr" \
	"$(INTDIR)\sp_clientserver.sbr" \
	"$(INTDIR)\sp_dsize_check.sbr" \
	"$(INTDIR)\sp_icmp_code_check.sbr" \
	"$(INTDIR)\sp_icmp_id_check.sbr" \
	"$(INTDIR)\sp_icmp_seq_check.sbr" \
	"$(INTDIR)\sp_icmp_type_check.sbr" \
	"$(INTDIR)\sp_ip_fragbits.sbr" \
	"$(INTDIR)\sp_ip_id_check.sbr" \
	"$(INTDIR)\sp_ip_proto.sbr" \
	"$(INTDIR)\sp_ip_same_check.sbr" \
	"$(INTDIR)\sp_ip_tos_check.sbr" \
	"$(INTDIR)\sp_ipoption_check.sbr" \
	"$(INTDIR)\sp_pattern_match.sbr" \
	"$(INTDIR)\sp_priority.sbr" \
	"$(INTDIR)\sp_react.sbr" \
	"$(INTDIR)\sp_reference.sbr" \
	"$(INTDIR)\sp_respond.sbr" \
	"$(INTDIR)\sp_rpc_check.sbr" \
	"$(INTDIR)\sp_session.sbr" \
	"$(INTDIR)\sp_tcp_ack_check.sbr" \
	"$(INTDIR)\sp_tcp_flag_check.sbr" \
	"$(INTDIR)\sp_tcp_seq_check.sbr" \
	"$(INTDIR)\sp_tcp_win_check.sbr" \
	"$(INTDIR)\sp_ttl_check.sbr" \
	"$(INTDIR)\spo_alert_fast.sbr" \
	"$(INTDIR)\spo_alert_full.sbr" \
	"$(INTDIR)\spo_alert_smb.sbr" \
	"$(INTDIR)\spo_alert_syslog.sbr" \
	"$(INTDIR)\spo_alert_unixsock.sbr" \
	"$(INTDIR)\spo_csv.sbr" \
	"$(INTDIR)\spo_database.sbr" \
	"$(INTDIR)\spo_idmef.sbr" \
	"$(INTDIR)\spo_log_ascii.sbr" \
	"$(INTDIR)\spo_log_null.sbr" \
	"$(INTDIR)\spo_log_tcpdump.sbr" \
	"$(INTDIR)\spo_SnmpTrap.sbr" \
	"$(INTDIR)\spo_unified.sbr" \
	"$(INTDIR)\spo_xml.sbr" \
	"$(INTDIR)\spp_arpspoof.sbr" \
	"$(INTDIR)\spp_asn1.sbr" \
	"$(INTDIR)\spp_bo.sbr" \
	"$(INTDIR)\spp_conversation.sbr" \
	"$(INTDIR)\spp_fnord.sbr" \
	"$(INTDIR)\spp_frag2.sbr" \
	"$(INTDIR)\spp_http_decode.sbr" \
	"$(INTDIR)\spp_portscan.sbr" \
	"$(INTDIR)\spp_portscan2.sbr" \
	"$(INTDIR)\spp_rpc_decode.sbr" \
	"$(INTDIR)\spp_stream4.sbr" \
	"$(INTDIR)\spp_telnet_negotiation.sbr"

"$(OUTDIR)\snort.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib Ntwdblib.lib mysqlclient.lib odbc32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\snort.pdb" /debug /machine:I386 /out:"$(OUTDIR)\snort.exe" /pdbtype:sept /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"

OUTDIR=.\snort___Win32_StdDB_MSSQL_Service_Release
INTDIR=.\snort___Win32_StdDB_MSSQL_Service_Release
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_MSSQL_Service_Release
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe" "$(OUTDIR)\snort.bsc"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\checksum.sbr"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\codes.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\decode.sbr"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\detect.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\mstring.sbr"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\plugbase.sbr"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snort.sbr"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\snprintf.sbr"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_clientserver.sbr"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_dsize_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.sbr"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.sbr"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.sbr"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_proto.sbr"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.sbr"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.sbr"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.sbr"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_pattern_match.sbr"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_priority.sbr"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_react.sbr"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_reference.sbr"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_respond.sbr"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_rpc_check.sbr"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_session.sbr"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.sbr"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.sbr"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_fast.sbr"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_full.sbr"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_smb.sbr"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.sbr"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.sbr"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_csv.sbr"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_database.sbr"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_idmef.sbr"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_ascii.sbr"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_null.sbr"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.sbr"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.sbr"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_unified.sbr"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spo_xml.sbr"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_arpspoof.sbr"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_asn1.sbr"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_bo.sbr"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_conversation.sbr"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_fnord.sbr"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_frag2.sbr"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_http_decode.sbr"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan.sbr"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_portscan2.sbr"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.sbr"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_stream4.sbr"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.sbr"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcatu.sbr"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\strlcpyu.sbr"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\substr.sbr"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\syslog.sbr"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\tag.sbr"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\trie.sbr"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_BinTree.sbr"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(INTDIR)\win32_service.sbr"
	-@erase "$(OUTDIR)\snort.bsc"
	-@erase "$(OUTDIR)\snort.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MSSQL" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_WIN32_SERVICE" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\snort.pch" /YX"snort.pch" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\checksum.sbr" \
	"$(INTDIR)\codes.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\decode.sbr" \
	"$(INTDIR)\detect.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mstring.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\plugbase.sbr" \
	"$(INTDIR)\snort.sbr" \
	"$(INTDIR)\snprintf.sbr" \
	"$(INTDIR)\strlcatu.sbr" \
	"$(INTDIR)\strlcpyu.sbr" \
	"$(INTDIR)\substr.sbr" \
	"$(INTDIR)\tag.sbr" \
	"$(INTDIR)\trie.sbr" \
	"$(INTDIR)\ubi_BinTree.sbr" \
	"$(INTDIR)\ubi_SplayTree.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\syslog.sbr" \
	"$(INTDIR)\win32_service.sbr" \
	"$(INTDIR)\sp_clientserver.sbr" \
	"$(INTDIR)\sp_dsize_check.sbr" \
	"$(INTDIR)\sp_icmp_code_check.sbr" \
	"$(INTDIR)\sp_icmp_id_check.sbr" \
	"$(INTDIR)\sp_icmp_seq_check.sbr" \
	"$(INTDIR)\sp_icmp_type_check.sbr" \
	"$(INTDIR)\sp_ip_fragbits.sbr" \
	"$(INTDIR)\sp_ip_id_check.sbr" \
	"$(INTDIR)\sp_ip_proto.sbr" \
	"$(INTDIR)\sp_ip_same_check.sbr" \
	"$(INTDIR)\sp_ip_tos_check.sbr" \
	"$(INTDIR)\sp_ipoption_check.sbr" \
	"$(INTDIR)\sp_pattern_match.sbr" \
	"$(INTDIR)\sp_priority.sbr" \
	"$(INTDIR)\sp_react.sbr" \
	"$(INTDIR)\sp_reference.sbr" \
	"$(INTDIR)\sp_respond.sbr" \
	"$(INTDIR)\sp_rpc_check.sbr" \
	"$(INTDIR)\sp_session.sbr" \
	"$(INTDIR)\sp_tcp_ack_check.sbr" \
	"$(INTDIR)\sp_tcp_flag_check.sbr" \
	"$(INTDIR)\sp_tcp_seq_check.sbr" \
	"$(INTDIR)\sp_tcp_win_check.sbr" \
	"$(INTDIR)\sp_ttl_check.sbr" \
	"$(INTDIR)\spo_alert_fast.sbr" \
	"$(INTDIR)\spo_alert_full.sbr" \
	"$(INTDIR)\spo_alert_smb.sbr" \
	"$(INTDIR)\spo_alert_syslog.sbr" \
	"$(INTDIR)\spo_alert_unixsock.sbr" \
	"$(INTDIR)\spo_csv.sbr" \
	"$(INTDIR)\spo_database.sbr" \
	"$(INTDIR)\spo_idmef.sbr" \
	"$(INTDIR)\spo_log_ascii.sbr" \
	"$(INTDIR)\spo_log_null.sbr" \
	"$(INTDIR)\spo_log_tcpdump.sbr" \
	"$(INTDIR)\spo_SnmpTrap.sbr" \
	"$(INTDIR)\spo_unified.sbr" \
	"$(INTDIR)\spo_xml.sbr" \
	"$(INTDIR)\spp_arpspoof.sbr" \
	"$(INTDIR)\spp_asn1.sbr" \
	"$(INTDIR)\spp_bo.sbr" \
	"$(INTDIR)\spp_conversation.sbr" \
	"$(INTDIR)\spp_fnord.sbr" \
	"$(INTDIR)\spp_frag2.sbr" \
	"$(INTDIR)\spp_http_decode.sbr" \
	"$(INTDIR)\spp_portscan.sbr" \
	"$(INTDIR)\spp_portscan2.sbr" \
	"$(INTDIR)\spp_rpc_decode.sbr" \
	"$(INTDIR)\spp_stream4.sbr" \
	"$(INTDIR)\spp_telnet_negotiation.sbr"

"$(OUTDIR)\snort.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib Ntwdblib.lib mysqlclient.lib odbc32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\snort.pdb" /machine:I386 /out:"$(OUTDIR)\snort.exe" /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"

OUTDIR=.\snort___Win32_StdDB_MSSQL_FlexResp_Debug
INTDIR=.\snort___Win32_StdDB_MSSQL_FlexResp_Debug
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_MSSQL_FlexResp_Debug
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe" "$(OUTDIR)\snort.bsc"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\checksum.sbr"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\codes.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\decode.sbr"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\detect.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\mstring.sbr"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\plugbase.sbr"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snort.sbr"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\snprintf.sbr"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_clientserver.sbr"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_dsize_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.sbr"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.sbr"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.sbr"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_proto.sbr"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.sbr"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.sbr"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.sbr"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_pattern_match.sbr"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_priority.sbr"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_react.sbr"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_reference.sbr"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_respond.sbr"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_rpc_check.sbr"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_session.sbr"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.sbr"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.sbr"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_fast.sbr"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_full.sbr"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_smb.sbr"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.sbr"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.sbr"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_csv.sbr"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_database.sbr"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_idmef.sbr"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_ascii.sbr"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_null.sbr"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.sbr"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.sbr"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_unified.sbr"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spo_xml.sbr"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_arpspoof.sbr"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_asn1.sbr"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_bo.sbr"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_conversation.sbr"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_fnord.sbr"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_frag2.sbr"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_http_decode.sbr"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan.sbr"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_portscan2.sbr"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.sbr"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_stream4.sbr"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.sbr"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcatu.sbr"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\strlcpyu.sbr"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\substr.sbr"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\syslog.sbr"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\tag.sbr"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\trie.sbr"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_BinTree.sbr"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(INTDIR)\win32_service.sbr"
	-@erase "$(OUTDIR)\snort.bsc"
	-@erase "$(OUTDIR)\snort.exe"
	-@erase "$(OUTDIR)\snort.ilk"
	-@erase "$(OUTDIR)\snort.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\Win32-Includes\libnet" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "_DEBUG" /D "DEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MSSQL" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_RESPONSE" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\snort.pch" /YX"snort.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\checksum.sbr" \
	"$(INTDIR)\codes.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\decode.sbr" \
	"$(INTDIR)\detect.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mstring.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\plugbase.sbr" \
	"$(INTDIR)\snort.sbr" \
	"$(INTDIR)\snprintf.sbr" \
	"$(INTDIR)\strlcatu.sbr" \
	"$(INTDIR)\strlcpyu.sbr" \
	"$(INTDIR)\substr.sbr" \
	"$(INTDIR)\tag.sbr" \
	"$(INTDIR)\trie.sbr" \
	"$(INTDIR)\ubi_BinTree.sbr" \
	"$(INTDIR)\ubi_SplayTree.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\syslog.sbr" \
	"$(INTDIR)\win32_service.sbr" \
	"$(INTDIR)\sp_clientserver.sbr" \
	"$(INTDIR)\sp_dsize_check.sbr" \
	"$(INTDIR)\sp_icmp_code_check.sbr" \
	"$(INTDIR)\sp_icmp_id_check.sbr" \
	"$(INTDIR)\sp_icmp_seq_check.sbr" \
	"$(INTDIR)\sp_icmp_type_check.sbr" \
	"$(INTDIR)\sp_ip_fragbits.sbr" \
	"$(INTDIR)\sp_ip_id_check.sbr" \
	"$(INTDIR)\sp_ip_proto.sbr" \
	"$(INTDIR)\sp_ip_same_check.sbr" \
	"$(INTDIR)\sp_ip_tos_check.sbr" \
	"$(INTDIR)\sp_ipoption_check.sbr" \
	"$(INTDIR)\sp_pattern_match.sbr" \
	"$(INTDIR)\sp_priority.sbr" \
	"$(INTDIR)\sp_react.sbr" \
	"$(INTDIR)\sp_reference.sbr" \
	"$(INTDIR)\sp_respond.sbr" \
	"$(INTDIR)\sp_rpc_check.sbr" \
	"$(INTDIR)\sp_session.sbr" \
	"$(INTDIR)\sp_tcp_ack_check.sbr" \
	"$(INTDIR)\sp_tcp_flag_check.sbr" \
	"$(INTDIR)\sp_tcp_seq_check.sbr" \
	"$(INTDIR)\sp_tcp_win_check.sbr" \
	"$(INTDIR)\sp_ttl_check.sbr" \
	"$(INTDIR)\spo_alert_fast.sbr" \
	"$(INTDIR)\spo_alert_full.sbr" \
	"$(INTDIR)\spo_alert_smb.sbr" \
	"$(INTDIR)\spo_alert_syslog.sbr" \
	"$(INTDIR)\spo_alert_unixsock.sbr" \
	"$(INTDIR)\spo_csv.sbr" \
	"$(INTDIR)\spo_database.sbr" \
	"$(INTDIR)\spo_idmef.sbr" \
	"$(INTDIR)\spo_log_ascii.sbr" \
	"$(INTDIR)\spo_log_null.sbr" \
	"$(INTDIR)\spo_log_tcpdump.sbr" \
	"$(INTDIR)\spo_SnmpTrap.sbr" \
	"$(INTDIR)\spo_unified.sbr" \
	"$(INTDIR)\spo_xml.sbr" \
	"$(INTDIR)\spp_arpspoof.sbr" \
	"$(INTDIR)\spp_asn1.sbr" \
	"$(INTDIR)\spp_bo.sbr" \
	"$(INTDIR)\spp_conversation.sbr" \
	"$(INTDIR)\spp_fnord.sbr" \
	"$(INTDIR)\spp_frag2.sbr" \
	"$(INTDIR)\spp_http_decode.sbr" \
	"$(INTDIR)\spp_portscan.sbr" \
	"$(INTDIR)\spp_portscan2.sbr" \
	"$(INTDIR)\spp_rpc_decode.sbr" \
	"$(INTDIR)\spp_stream4.sbr" \
	"$(INTDIR)\spp_telnet_negotiation.sbr"

"$(OUTDIR)\snort.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib Ntwdblib.lib mysqlclient.lib libnetnt.lib odbc32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\snort.pdb" /debug /machine:I386 /out:"$(OUTDIR)\snort.exe" /pdbtype:sept /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" /libpath:"..\Win32-Libraries\libnet" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"

OUTDIR=.\snort___Win32_StdDB_MSSQL_FlexResp_Release
INTDIR=.\snort___Win32_StdDB_MSSQL_FlexResp_Release
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_MSSQL_FlexResp_Release
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe" "$(OUTDIR)\snort.bsc"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\checksum.sbr"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\codes.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\decode.sbr"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\detect.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\mstring.sbr"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\plugbase.sbr"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snort.sbr"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\snprintf.sbr"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_clientserver.sbr"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_dsize_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.sbr"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.sbr"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.sbr"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_proto.sbr"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.sbr"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.sbr"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.sbr"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_pattern_match.sbr"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_priority.sbr"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_react.sbr"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_reference.sbr"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_respond.sbr"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_rpc_check.sbr"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_session.sbr"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.sbr"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.sbr"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_fast.sbr"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_full.sbr"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_smb.sbr"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.sbr"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.sbr"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_csv.sbr"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_database.sbr"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_idmef.sbr"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_ascii.sbr"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_null.sbr"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.sbr"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.sbr"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_unified.sbr"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spo_xml.sbr"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_arpspoof.sbr"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_asn1.sbr"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_bo.sbr"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_conversation.sbr"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_fnord.sbr"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_frag2.sbr"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_http_decode.sbr"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan.sbr"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_portscan2.sbr"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.sbr"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_stream4.sbr"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.sbr"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcatu.sbr"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\strlcpyu.sbr"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\substr.sbr"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\syslog.sbr"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\tag.sbr"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\trie.sbr"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_BinTree.sbr"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(INTDIR)\win32_service.sbr"
	-@erase "$(OUTDIR)\snort.bsc"
	-@erase "$(OUTDIR)\snort.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\Win32-Includes\libnet" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MSSQL" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_RESPONSE" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\snort.pch" /YX"snort.pch" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\checksum.sbr" \
	"$(INTDIR)\codes.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\decode.sbr" \
	"$(INTDIR)\detect.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mstring.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\plugbase.sbr" \
	"$(INTDIR)\snort.sbr" \
	"$(INTDIR)\snprintf.sbr" \
	"$(INTDIR)\strlcatu.sbr" \
	"$(INTDIR)\strlcpyu.sbr" \
	"$(INTDIR)\substr.sbr" \
	"$(INTDIR)\tag.sbr" \
	"$(INTDIR)\trie.sbr" \
	"$(INTDIR)\ubi_BinTree.sbr" \
	"$(INTDIR)\ubi_SplayTree.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\syslog.sbr" \
	"$(INTDIR)\win32_service.sbr" \
	"$(INTDIR)\sp_clientserver.sbr" \
	"$(INTDIR)\sp_dsize_check.sbr" \
	"$(INTDIR)\sp_icmp_code_check.sbr" \
	"$(INTDIR)\sp_icmp_id_check.sbr" \
	"$(INTDIR)\sp_icmp_seq_check.sbr" \
	"$(INTDIR)\sp_icmp_type_check.sbr" \
	"$(INTDIR)\sp_ip_fragbits.sbr" \
	"$(INTDIR)\sp_ip_id_check.sbr" \
	"$(INTDIR)\sp_ip_proto.sbr" \
	"$(INTDIR)\sp_ip_same_check.sbr" \
	"$(INTDIR)\sp_ip_tos_check.sbr" \
	"$(INTDIR)\sp_ipoption_check.sbr" \
	"$(INTDIR)\sp_pattern_match.sbr" \
	"$(INTDIR)\sp_priority.sbr" \
	"$(INTDIR)\sp_react.sbr" \
	"$(INTDIR)\sp_reference.sbr" \
	"$(INTDIR)\sp_respond.sbr" \
	"$(INTDIR)\sp_rpc_check.sbr" \
	"$(INTDIR)\sp_session.sbr" \
	"$(INTDIR)\sp_tcp_ack_check.sbr" \
	"$(INTDIR)\sp_tcp_flag_check.sbr" \
	"$(INTDIR)\sp_tcp_seq_check.sbr" \
	"$(INTDIR)\sp_tcp_win_check.sbr" \
	"$(INTDIR)\sp_ttl_check.sbr" \
	"$(INTDIR)\spo_alert_fast.sbr" \
	"$(INTDIR)\spo_alert_full.sbr" \
	"$(INTDIR)\spo_alert_smb.sbr" \
	"$(INTDIR)\spo_alert_syslog.sbr" \
	"$(INTDIR)\spo_alert_unixsock.sbr" \
	"$(INTDIR)\spo_csv.sbr" \
	"$(INTDIR)\spo_database.sbr" \
	"$(INTDIR)\spo_idmef.sbr" \
	"$(INTDIR)\spo_log_ascii.sbr" \
	"$(INTDIR)\spo_log_null.sbr" \
	"$(INTDIR)\spo_log_tcpdump.sbr" \
	"$(INTDIR)\spo_SnmpTrap.sbr" \
	"$(INTDIR)\spo_unified.sbr" \
	"$(INTDIR)\spo_xml.sbr" \
	"$(INTDIR)\spp_arpspoof.sbr" \
	"$(INTDIR)\spp_asn1.sbr" \
	"$(INTDIR)\spp_bo.sbr" \
	"$(INTDIR)\spp_conversation.sbr" \
	"$(INTDIR)\spp_fnord.sbr" \
	"$(INTDIR)\spp_frag2.sbr" \
	"$(INTDIR)\spp_http_decode.sbr" \
	"$(INTDIR)\spp_portscan.sbr" \
	"$(INTDIR)\spp_portscan2.sbr" \
	"$(INTDIR)\spp_rpc_decode.sbr" \
	"$(INTDIR)\spp_stream4.sbr" \
	"$(INTDIR)\spp_telnet_negotiation.sbr"

"$(OUTDIR)\snort.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib Ntwdblib.lib mysqlclient.lib libnetnt.lib odbc32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\snort.pdb" /machine:I386 /out:"$(OUTDIR)\snort.exe" /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" /libpath:"..\Win32-Libraries\libnet" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"

OUTDIR=.\snort___Win32_StdDB_MSSQL_FlexResp_Service_Debug
INTDIR=.\snort___Win32_StdDB_MSSQL_FlexResp_Service_Debug
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_MSSQL_FlexResp_Service_Debug
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe" "$(OUTDIR)\snort.bsc"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\checksum.sbr"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\codes.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\decode.sbr"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\detect.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\mstring.sbr"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\plugbase.sbr"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snort.sbr"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\snprintf.sbr"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_clientserver.sbr"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_dsize_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.sbr"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.sbr"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.sbr"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_proto.sbr"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.sbr"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.sbr"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.sbr"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_pattern_match.sbr"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_priority.sbr"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_react.sbr"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_reference.sbr"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_respond.sbr"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_rpc_check.sbr"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_session.sbr"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.sbr"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.sbr"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_fast.sbr"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_full.sbr"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_smb.sbr"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.sbr"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.sbr"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_csv.sbr"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_database.sbr"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_idmef.sbr"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_ascii.sbr"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_null.sbr"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.sbr"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.sbr"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_unified.sbr"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spo_xml.sbr"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_arpspoof.sbr"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_asn1.sbr"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_bo.sbr"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_conversation.sbr"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_fnord.sbr"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_frag2.sbr"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_http_decode.sbr"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan.sbr"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_portscan2.sbr"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.sbr"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_stream4.sbr"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.sbr"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcatu.sbr"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\strlcpyu.sbr"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\substr.sbr"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\syslog.sbr"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\tag.sbr"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\trie.sbr"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_BinTree.sbr"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(INTDIR)\win32_service.sbr"
	-@erase "$(OUTDIR)\snort.bsc"
	-@erase "$(OUTDIR)\snort.exe"
	-@erase "$(OUTDIR)\snort.ilk"
	-@erase "$(OUTDIR)\snort.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\Win32-Includes\libnet" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "_DEBUG" /D "DEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MSSQL" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_RESPONSE" /D "ENABLE_WIN32_SERVICE" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\snort.pch" /YX"snort.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\checksum.sbr" \
	"$(INTDIR)\codes.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\decode.sbr" \
	"$(INTDIR)\detect.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mstring.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\plugbase.sbr" \
	"$(INTDIR)\snort.sbr" \
	"$(INTDIR)\snprintf.sbr" \
	"$(INTDIR)\strlcatu.sbr" \
	"$(INTDIR)\strlcpyu.sbr" \
	"$(INTDIR)\substr.sbr" \
	"$(INTDIR)\tag.sbr" \
	"$(INTDIR)\trie.sbr" \
	"$(INTDIR)\ubi_BinTree.sbr" \
	"$(INTDIR)\ubi_SplayTree.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\syslog.sbr" \
	"$(INTDIR)\win32_service.sbr" \
	"$(INTDIR)\sp_clientserver.sbr" \
	"$(INTDIR)\sp_dsize_check.sbr" \
	"$(INTDIR)\sp_icmp_code_check.sbr" \
	"$(INTDIR)\sp_icmp_id_check.sbr" \
	"$(INTDIR)\sp_icmp_seq_check.sbr" \
	"$(INTDIR)\sp_icmp_type_check.sbr" \
	"$(INTDIR)\sp_ip_fragbits.sbr" \
	"$(INTDIR)\sp_ip_id_check.sbr" \
	"$(INTDIR)\sp_ip_proto.sbr" \
	"$(INTDIR)\sp_ip_same_check.sbr" \
	"$(INTDIR)\sp_ip_tos_check.sbr" \
	"$(INTDIR)\sp_ipoption_check.sbr" \
	"$(INTDIR)\sp_pattern_match.sbr" \
	"$(INTDIR)\sp_priority.sbr" \
	"$(INTDIR)\sp_react.sbr" \
	"$(INTDIR)\sp_reference.sbr" \
	"$(INTDIR)\sp_respond.sbr" \
	"$(INTDIR)\sp_rpc_check.sbr" \
	"$(INTDIR)\sp_session.sbr" \
	"$(INTDIR)\sp_tcp_ack_check.sbr" \
	"$(INTDIR)\sp_tcp_flag_check.sbr" \
	"$(INTDIR)\sp_tcp_seq_check.sbr" \
	"$(INTDIR)\sp_tcp_win_check.sbr" \
	"$(INTDIR)\sp_ttl_check.sbr" \
	"$(INTDIR)\spo_alert_fast.sbr" \
	"$(INTDIR)\spo_alert_full.sbr" \
	"$(INTDIR)\spo_alert_smb.sbr" \
	"$(INTDIR)\spo_alert_syslog.sbr" \
	"$(INTDIR)\spo_alert_unixsock.sbr" \
	"$(INTDIR)\spo_csv.sbr" \
	"$(INTDIR)\spo_database.sbr" \
	"$(INTDIR)\spo_idmef.sbr" \
	"$(INTDIR)\spo_log_ascii.sbr" \
	"$(INTDIR)\spo_log_null.sbr" \
	"$(INTDIR)\spo_log_tcpdump.sbr" \
	"$(INTDIR)\spo_SnmpTrap.sbr" \
	"$(INTDIR)\spo_unified.sbr" \
	"$(INTDIR)\spo_xml.sbr" \
	"$(INTDIR)\spp_arpspoof.sbr" \
	"$(INTDIR)\spp_asn1.sbr" \
	"$(INTDIR)\spp_bo.sbr" \
	"$(INTDIR)\spp_conversation.sbr" \
	"$(INTDIR)\spp_fnord.sbr" \
	"$(INTDIR)\spp_frag2.sbr" \
	"$(INTDIR)\spp_http_decode.sbr" \
	"$(INTDIR)\spp_portscan.sbr" \
	"$(INTDIR)\spp_portscan2.sbr" \
	"$(INTDIR)\spp_rpc_decode.sbr" \
	"$(INTDIR)\spp_stream4.sbr" \
	"$(INTDIR)\spp_telnet_negotiation.sbr"

"$(OUTDIR)\snort.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib Ntwdblib.lib mysqlclient.lib libnetnt.lib odbc32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\snort.pdb" /debug /machine:I386 /out:"$(OUTDIR)\snort.exe" /pdbtype:sept /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" /libpath:"..\Win32-Libraries\libnet" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"

OUTDIR=.\snort___Win32_StdDB_MSSQL_FlexResp_Service_Release
INTDIR=.\snort___Win32_StdDB_MSSQL_FlexResp_Service_Release
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_MSSQL_FlexResp_Service_Release
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe" "$(OUTDIR)\snort.bsc"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\checksum.sbr"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\codes.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\decode.sbr"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\detect.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\mstring.sbr"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\plugbase.sbr"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snort.sbr"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\snprintf.sbr"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_clientserver.sbr"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_dsize_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.sbr"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.sbr"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.sbr"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_proto.sbr"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.sbr"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.sbr"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.sbr"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_pattern_match.sbr"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_priority.sbr"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_react.sbr"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_reference.sbr"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_respond.sbr"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_rpc_check.sbr"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_session.sbr"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.sbr"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.sbr"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.sbr"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_fast.sbr"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_full.sbr"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_smb.sbr"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.sbr"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.sbr"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_csv.sbr"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_database.sbr"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_idmef.sbr"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_ascii.sbr"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_null.sbr"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.sbr"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.sbr"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_unified.sbr"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spo_xml.sbr"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_arpspoof.sbr"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_asn1.sbr"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_bo.sbr"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_conversation.sbr"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_fnord.sbr"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_frag2.sbr"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_http_decode.sbr"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan.sbr"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_portscan2.sbr"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.sbr"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_stream4.sbr"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.sbr"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcatu.sbr"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\strlcpyu.sbr"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\substr.sbr"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\syslog.sbr"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\tag.sbr"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\trie.sbr"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_BinTree.sbr"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.sbr"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\util.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(INTDIR)\win32_service.sbr"
	-@erase "$(OUTDIR)\snort.bsc"
	-@erase "$(OUTDIR)\snort.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\Win32-Includes\libnet" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MSSQL" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_RESPONSE" /D "ENABLE_WIN32_SERVICE" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\snort.pch" /YX"snort.pch" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\checksum.sbr" \
	"$(INTDIR)\codes.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\decode.sbr" \
	"$(INTDIR)\detect.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mstring.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\plugbase.sbr" \
	"$(INTDIR)\snort.sbr" \
	"$(INTDIR)\snprintf.sbr" \
	"$(INTDIR)\strlcatu.sbr" \
	"$(INTDIR)\strlcpyu.sbr" \
	"$(INTDIR)\substr.sbr" \
	"$(INTDIR)\tag.sbr" \
	"$(INTDIR)\trie.sbr" \
	"$(INTDIR)\ubi_BinTree.sbr" \
	"$(INTDIR)\ubi_SplayTree.sbr" \
	"$(INTDIR)\util.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\syslog.sbr" \
	"$(INTDIR)\win32_service.sbr" \
	"$(INTDIR)\sp_clientserver.sbr" \
	"$(INTDIR)\sp_dsize_check.sbr" \
	"$(INTDIR)\sp_icmp_code_check.sbr" \
	"$(INTDIR)\sp_icmp_id_check.sbr" \
	"$(INTDIR)\sp_icmp_seq_check.sbr" \
	"$(INTDIR)\sp_icmp_type_check.sbr" \
	"$(INTDIR)\sp_ip_fragbits.sbr" \
	"$(INTDIR)\sp_ip_id_check.sbr" \
	"$(INTDIR)\sp_ip_proto.sbr" \
	"$(INTDIR)\sp_ip_same_check.sbr" \
	"$(INTDIR)\sp_ip_tos_check.sbr" \
	"$(INTDIR)\sp_ipoption_check.sbr" \
	"$(INTDIR)\sp_pattern_match.sbr" \
	"$(INTDIR)\sp_priority.sbr" \
	"$(INTDIR)\sp_react.sbr" \
	"$(INTDIR)\sp_reference.sbr" \
	"$(INTDIR)\sp_respond.sbr" \
	"$(INTDIR)\sp_rpc_check.sbr" \
	"$(INTDIR)\sp_session.sbr" \
	"$(INTDIR)\sp_tcp_ack_check.sbr" \
	"$(INTDIR)\sp_tcp_flag_check.sbr" \
	"$(INTDIR)\sp_tcp_seq_check.sbr" \
	"$(INTDIR)\sp_tcp_win_check.sbr" \
	"$(INTDIR)\sp_ttl_check.sbr" \
	"$(INTDIR)\spo_alert_fast.sbr" \
	"$(INTDIR)\spo_alert_full.sbr" \
	"$(INTDIR)\spo_alert_smb.sbr" \
	"$(INTDIR)\spo_alert_syslog.sbr" \
	"$(INTDIR)\spo_alert_unixsock.sbr" \
	"$(INTDIR)\spo_csv.sbr" \
	"$(INTDIR)\spo_database.sbr" \
	"$(INTDIR)\spo_idmef.sbr" \
	"$(INTDIR)\spo_log_ascii.sbr" \
	"$(INTDIR)\spo_log_null.sbr" \
	"$(INTDIR)\spo_log_tcpdump.sbr" \
	"$(INTDIR)\spo_SnmpTrap.sbr" \
	"$(INTDIR)\spo_unified.sbr" \
	"$(INTDIR)\spo_xml.sbr" \
	"$(INTDIR)\spp_arpspoof.sbr" \
	"$(INTDIR)\spp_asn1.sbr" \
	"$(INTDIR)\spp_bo.sbr" \
	"$(INTDIR)\spp_conversation.sbr" \
	"$(INTDIR)\spp_fnord.sbr" \
	"$(INTDIR)\spp_frag2.sbr" \
	"$(INTDIR)\spp_http_decode.sbr" \
	"$(INTDIR)\spp_portscan.sbr" \
	"$(INTDIR)\spp_portscan2.sbr" \
	"$(INTDIR)\spp_rpc_decode.sbr" \
	"$(INTDIR)\spp_stream4.sbr" \
	"$(INTDIR)\spp_telnet_negotiation.sbr"

"$(OUTDIR)\snort.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib Ntwdblib.lib mysqlclient.lib libnetnt.lib odbc32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\snort.pdb" /machine:I386 /out:"$(OUTDIR)\snort.exe" /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" /libpath:"..\Win32-Libraries\libnet" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"

OUTDIR=.\snort___Win32_StdDB_Service_Debug
INTDIR=.\snort___Win32_StdDB_Service_Debug
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_Service_Debug
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(OUTDIR)\snort.exe"
	-@erase "$(OUTDIR)\snort.ilk"
	-@erase "$(OUTDIR)\snort.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "_DEBUG" /D "DEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_WIN32_SERVICE" /Fp"$(INTDIR)\snort.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib mysqlclient.lib odbc32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\snort.pdb" /debug /machine:I386 /out:"$(OUTDIR)\snort.exe" /pdbtype:sept /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"

OUTDIR=.\snort___Win32_StdDB_Service_Release
INTDIR=.\snort___Win32_StdDB_Service_Release
# Begin Custom Macros
OutDir=.\snort___Win32_StdDB_Service_Release
# End Custom Macros

ALL : "$(OUTDIR)\snort.exe"


CLEAN :
	-@erase "$(INTDIR)\checksum.obj"
	-@erase "$(INTDIR)\codes.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\decode.obj"
	-@erase "$(INTDIR)\detect.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\mstring.obj"
	-@erase "$(INTDIR)\name.res"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\plugbase.obj"
	-@erase "$(INTDIR)\snort.obj"
	-@erase "$(INTDIR)\snprintf.obj"
	-@erase "$(INTDIR)\sp_clientserver.obj"
	-@erase "$(INTDIR)\sp_dsize_check.obj"
	-@erase "$(INTDIR)\sp_icmp_code_check.obj"
	-@erase "$(INTDIR)\sp_icmp_id_check.obj"
	-@erase "$(INTDIR)\sp_icmp_seq_check.obj"
	-@erase "$(INTDIR)\sp_icmp_type_check.obj"
	-@erase "$(INTDIR)\sp_ip_fragbits.obj"
	-@erase "$(INTDIR)\sp_ip_id_check.obj"
	-@erase "$(INTDIR)\sp_ip_proto.obj"
	-@erase "$(INTDIR)\sp_ip_same_check.obj"
	-@erase "$(INTDIR)\sp_ip_tos_check.obj"
	-@erase "$(INTDIR)\sp_ipoption_check.obj"
	-@erase "$(INTDIR)\sp_pattern_match.obj"
	-@erase "$(INTDIR)\sp_priority.obj"
	-@erase "$(INTDIR)\sp_react.obj"
	-@erase "$(INTDIR)\sp_reference.obj"
	-@erase "$(INTDIR)\sp_respond.obj"
	-@erase "$(INTDIR)\sp_rpc_check.obj"
	-@erase "$(INTDIR)\sp_session.obj"
	-@erase "$(INTDIR)\sp_tcp_ack_check.obj"
	-@erase "$(INTDIR)\sp_tcp_flag_check.obj"
	-@erase "$(INTDIR)\sp_tcp_seq_check.obj"
	-@erase "$(INTDIR)\sp_tcp_win_check.obj"
	-@erase "$(INTDIR)\sp_ttl_check.obj"
	-@erase "$(INTDIR)\spo_alert_fast.obj"
	-@erase "$(INTDIR)\spo_alert_full.obj"
	-@erase "$(INTDIR)\spo_alert_smb.obj"
	-@erase "$(INTDIR)\spo_alert_syslog.obj"
	-@erase "$(INTDIR)\spo_alert_unixsock.obj"
	-@erase "$(INTDIR)\spo_csv.obj"
	-@erase "$(INTDIR)\spo_database.obj"
	-@erase "$(INTDIR)\spo_idmef.obj"
	-@erase "$(INTDIR)\spo_log_ascii.obj"
	-@erase "$(INTDIR)\spo_log_null.obj"
	-@erase "$(INTDIR)\spo_log_tcpdump.obj"
	-@erase "$(INTDIR)\spo_SnmpTrap.obj"
	-@erase "$(INTDIR)\spo_unified.obj"
	-@erase "$(INTDIR)\spo_xml.obj"
	-@erase "$(INTDIR)\spp_arpspoof.obj"
	-@erase "$(INTDIR)\spp_asn1.obj"
	-@erase "$(INTDIR)\spp_bo.obj"
	-@erase "$(INTDIR)\spp_conversation.obj"
	-@erase "$(INTDIR)\spp_fnord.obj"
	-@erase "$(INTDIR)\spp_frag2.obj"
	-@erase "$(INTDIR)\spp_http_decode.obj"
	-@erase "$(INTDIR)\spp_portscan.obj"
	-@erase "$(INTDIR)\spp_portscan2.obj"
	-@erase "$(INTDIR)\spp_rpc_decode.obj"
	-@erase "$(INTDIR)\spp_stream4.obj"
	-@erase "$(INTDIR)\spp_telnet_negotiation.obj"
	-@erase "$(INTDIR)\strlcatu.obj"
	-@erase "$(INTDIR)\strlcpyu.obj"
	-@erase "$(INTDIR)\substr.obj"
	-@erase "$(INTDIR)\syslog.obj"
	-@erase "$(INTDIR)\tag.obj"
	-@erase "$(INTDIR)\trie.obj"
	-@erase "$(INTDIR)\ubi_BinTree.obj"
	-@erase "$(INTDIR)\ubi_SplayTree.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\win32_service.obj"
	-@erase "$(OUTDIR)\snort.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\Win32-Includes" /I "..\Win32-Includes\mysql" /I "..\..\detection-plugins" /I "..\..\output-plugins" /I "..\..\preprocessors" /I "..\..\\" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D __BEGIN_DECLS="" /D __END_DECLS="" /D "HAVE_CONFIG_H" /D "ENABLE_MYSQL" /D "ENABLE_ODBC" /D "ENABLE_WIN32_SERVICE" /Fp"$(INTDIR)\snort.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\name.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\snort.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=user32.lib wsock32.lib libpcap.lib advapi32.lib mysqlclient.lib odbc32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\snort.pdb" /machine:I386 /out:"$(OUTDIR)\snort.exe" /libpath:"..\Win32-Libraries" /libpath:"..\Win32-Libraries\mysql" 
LINK32_OBJS= \
	"$(INTDIR)\checksum.obj" \
	"$(INTDIR)\codes.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\decode.obj" \
	"$(INTDIR)\detect.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mstring.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\plugbase.obj" \
	"$(INTDIR)\snort.obj" \
	"$(INTDIR)\snprintf.obj" \
	"$(INTDIR)\strlcatu.obj" \
	"$(INTDIR)\strlcpyu.obj" \
	"$(INTDIR)\substr.obj" \
	"$(INTDIR)\tag.obj" \
	"$(INTDIR)\trie.obj" \
	"$(INTDIR)\ubi_BinTree.obj" \
	"$(INTDIR)\ubi_SplayTree.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\syslog.obj" \
	"$(INTDIR)\win32_service.obj" \
	"$(INTDIR)\sp_clientserver.obj" \
	"$(INTDIR)\sp_dsize_check.obj" \
	"$(INTDIR)\sp_icmp_code_check.obj" \
	"$(INTDIR)\sp_icmp_id_check.obj" \
	"$(INTDIR)\sp_icmp_seq_check.obj" \
	"$(INTDIR)\sp_icmp_type_check.obj" \
	"$(INTDIR)\sp_ip_fragbits.obj" \
	"$(INTDIR)\sp_ip_id_check.obj" \
	"$(INTDIR)\sp_ip_proto.obj" \
	"$(INTDIR)\sp_ip_same_check.obj" \
	"$(INTDIR)\sp_ip_tos_check.obj" \
	"$(INTDIR)\sp_ipoption_check.obj" \
	"$(INTDIR)\sp_pattern_match.obj" \
	"$(INTDIR)\sp_priority.obj" \
	"$(INTDIR)\sp_react.obj" \
	"$(INTDIR)\sp_reference.obj" \
	"$(INTDIR)\sp_respond.obj" \
	"$(INTDIR)\sp_rpc_check.obj" \
	"$(INTDIR)\sp_session.obj" \
	"$(INTDIR)\sp_tcp_ack_check.obj" \
	"$(INTDIR)\sp_tcp_flag_check.obj" \
	"$(INTDIR)\sp_tcp_seq_check.obj" \
	"$(INTDIR)\sp_tcp_win_check.obj" \
	"$(INTDIR)\sp_ttl_check.obj" \
	"$(INTDIR)\spo_alert_fast.obj" \
	"$(INTDIR)\spo_alert_full.obj" \
	"$(INTDIR)\spo_alert_smb.obj" \
	"$(INTDIR)\spo_alert_syslog.obj" \
	"$(INTDIR)\spo_alert_unixsock.obj" \
	"$(INTDIR)\spo_csv.obj" \
	"$(INTDIR)\spo_database.obj" \
	"$(INTDIR)\spo_idmef.obj" \
	"$(INTDIR)\spo_log_ascii.obj" \
	"$(INTDIR)\spo_log_null.obj" \
	"$(INTDIR)\spo_log_tcpdump.obj" \
	"$(INTDIR)\spo_SnmpTrap.obj" \
	"$(INTDIR)\spo_unified.obj" \
	"$(INTDIR)\spo_xml.obj" \
	"$(INTDIR)\spp_arpspoof.obj" \
	"$(INTDIR)\spp_asn1.obj" \
	"$(INTDIR)\spp_bo.obj" \
	"$(INTDIR)\spp_conversation.obj" \
	"$(INTDIR)\spp_fnord.obj" \
	"$(INTDIR)\spp_frag2.obj" \
	"$(INTDIR)\spp_http_decode.obj" \
	"$(INTDIR)\spp_portscan.obj" \
	"$(INTDIR)\spp_portscan2.obj" \
	"$(INTDIR)\spp_rpc_decode.obj" \
	"$(INTDIR)\spp_stream4.obj" \
	"$(INTDIR)\spp_telnet_negotiation.obj" \
	"$(INTDIR)\name.res"

"$(OUTDIR)\snort.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("snort.dep")
!INCLUDE "snort.dep"
!ELSE 
!MESSAGE Warning: cannot find "snort.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "snort - Win32 StdDB Debug" || "$(CFG)" == "snort - Win32 StdDB Release" || "$(CFG)" == "snort - Win32 StdDB FlexResp Debug" || "$(CFG)" == "snort - Win32 StdDB FlexResp Release" || "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug" || "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release" || "$(CFG)" == "snort - Win32 StdDB MSSQL Debug" || "$(CFG)" == "snort - Win32 StdDB MSSQL Release" || "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug" || "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release" || "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug" || "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release" || "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug" || "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release" || "$(CFG)" == "snort - Win32 StdDB Service Debug" || "$(CFG)" == "snort - Win32 StdDB Service Release"
SOURCE=..\..\checksum.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\checksum.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\checksum.obj"	"$(INTDIR)\checksum.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\checksum.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\checksum.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\checksum.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\checksum.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\checksum.obj"	"$(INTDIR)\checksum.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\checksum.obj"	"$(INTDIR)\checksum.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\checksum.obj"	"$(INTDIR)\checksum.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\checksum.obj"	"$(INTDIR)\checksum.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\checksum.obj"	"$(INTDIR)\checksum.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\checksum.obj"	"$(INTDIR)\checksum.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\checksum.obj"	"$(INTDIR)\checksum.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\checksum.obj"	"$(INTDIR)\checksum.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\checksum.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\checksum.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\codes.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\codes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\codes.obj"	"$(INTDIR)\codes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\codes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\codes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\codes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\codes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\codes.obj"	"$(INTDIR)\codes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\codes.obj"	"$(INTDIR)\codes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\codes.obj"	"$(INTDIR)\codes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\codes.obj"	"$(INTDIR)\codes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\codes.obj"	"$(INTDIR)\codes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\codes.obj"	"$(INTDIR)\codes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\codes.obj"	"$(INTDIR)\codes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\codes.obj"	"$(INTDIR)\codes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\codes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\codes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\debug.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\decode.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\decode.obj"	"$(INTDIR)\decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\decode.obj"	"$(INTDIR)\decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\decode.obj"	"$(INTDIR)\decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\decode.obj"	"$(INTDIR)\decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\decode.obj"	"$(INTDIR)\decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\decode.obj"	"$(INTDIR)\decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\decode.obj"	"$(INTDIR)\decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\decode.obj"	"$(INTDIR)\decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\decode.obj"	"$(INTDIR)\decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\detect.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\detect.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\detect.obj"	"$(INTDIR)\detect.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\detect.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\detect.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\detect.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\detect.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\detect.obj"	"$(INTDIR)\detect.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\detect.obj"	"$(INTDIR)\detect.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\detect.obj"	"$(INTDIR)\detect.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\detect.obj"	"$(INTDIR)\detect.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\detect.obj"	"$(INTDIR)\detect.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\detect.obj"	"$(INTDIR)\detect.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\detect.obj"	"$(INTDIR)\detect.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\detect.obj"	"$(INTDIR)\detect.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\detect.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\detect.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\log.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\log.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\log.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\log.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\log.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\log.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\log.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\log.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\mstring.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\mstring.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\mstring.obj"	"$(INTDIR)\mstring.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\mstring.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\mstring.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\mstring.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\mstring.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\mstring.obj"	"$(INTDIR)\mstring.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\mstring.obj"	"$(INTDIR)\mstring.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\mstring.obj"	"$(INTDIR)\mstring.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\mstring.obj"	"$(INTDIR)\mstring.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\mstring.obj"	"$(INTDIR)\mstring.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\mstring.obj"	"$(INTDIR)\mstring.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\mstring.obj"	"$(INTDIR)\mstring.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\mstring.obj"	"$(INTDIR)\mstring.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\mstring.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\mstring.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\parser.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\parser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\parser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\parser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\parser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\parser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\parser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\parser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\plugbase.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\plugbase.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\plugbase.obj"	"$(INTDIR)\plugbase.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\plugbase.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\plugbase.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\plugbase.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\plugbase.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\plugbase.obj"	"$(INTDIR)\plugbase.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\plugbase.obj"	"$(INTDIR)\plugbase.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\plugbase.obj"	"$(INTDIR)\plugbase.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\plugbase.obj"	"$(INTDIR)\plugbase.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\plugbase.obj"	"$(INTDIR)\plugbase.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\plugbase.obj"	"$(INTDIR)\plugbase.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\plugbase.obj"	"$(INTDIR)\plugbase.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\plugbase.obj"	"$(INTDIR)\plugbase.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\plugbase.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\plugbase.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\snort.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\snort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\snort.obj"	"$(INTDIR)\snort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\snort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\snort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\snort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\snort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\snort.obj"	"$(INTDIR)\snort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\snort.obj"	"$(INTDIR)\snort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\snort.obj"	"$(INTDIR)\snort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\snort.obj"	"$(INTDIR)\snort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\snort.obj"	"$(INTDIR)\snort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\snort.obj"	"$(INTDIR)\snort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\snort.obj"	"$(INTDIR)\snort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\snort.obj"	"$(INTDIR)\snort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\snort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\snort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\snprintf.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\snprintf.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\snprintf.obj"	"$(INTDIR)\snprintf.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\snprintf.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\snprintf.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\snprintf.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\snprintf.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\snprintf.obj"	"$(INTDIR)\snprintf.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\snprintf.obj"	"$(INTDIR)\snprintf.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\snprintf.obj"	"$(INTDIR)\snprintf.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\snprintf.obj"	"$(INTDIR)\snprintf.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\snprintf.obj"	"$(INTDIR)\snprintf.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\snprintf.obj"	"$(INTDIR)\snprintf.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\snprintf.obj"	"$(INTDIR)\snprintf.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\snprintf.obj"	"$(INTDIR)\snprintf.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\snprintf.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\snprintf.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\strlcatu.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\strlcatu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\strlcatu.obj"	"$(INTDIR)\strlcatu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\strlcatu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\strlcatu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\strlcatu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\strlcatu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\strlcatu.obj"	"$(INTDIR)\strlcatu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\strlcatu.obj"	"$(INTDIR)\strlcatu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\strlcatu.obj"	"$(INTDIR)\strlcatu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\strlcatu.obj"	"$(INTDIR)\strlcatu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\strlcatu.obj"	"$(INTDIR)\strlcatu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\strlcatu.obj"	"$(INTDIR)\strlcatu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\strlcatu.obj"	"$(INTDIR)\strlcatu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\strlcatu.obj"	"$(INTDIR)\strlcatu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\strlcatu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\strlcatu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\strlcpyu.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\strlcpyu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\strlcpyu.obj"	"$(INTDIR)\strlcpyu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\strlcpyu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\strlcpyu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\strlcpyu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\strlcpyu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\strlcpyu.obj"	"$(INTDIR)\strlcpyu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\strlcpyu.obj"	"$(INTDIR)\strlcpyu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\strlcpyu.obj"	"$(INTDIR)\strlcpyu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\strlcpyu.obj"	"$(INTDIR)\strlcpyu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\strlcpyu.obj"	"$(INTDIR)\strlcpyu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\strlcpyu.obj"	"$(INTDIR)\strlcpyu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\strlcpyu.obj"	"$(INTDIR)\strlcpyu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\strlcpyu.obj"	"$(INTDIR)\strlcpyu.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\strlcpyu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\strlcpyu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\substr.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\substr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\substr.obj"	"$(INTDIR)\substr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\substr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\substr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\substr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\substr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\substr.obj"	"$(INTDIR)\substr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\substr.obj"	"$(INTDIR)\substr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\substr.obj"	"$(INTDIR)\substr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\substr.obj"	"$(INTDIR)\substr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\substr.obj"	"$(INTDIR)\substr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\substr.obj"	"$(INTDIR)\substr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\substr.obj"	"$(INTDIR)\substr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\substr.obj"	"$(INTDIR)\substr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\substr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\substr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\tag.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\tag.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\tag.obj"	"$(INTDIR)\tag.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\tag.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\tag.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\tag.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\tag.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\tag.obj"	"$(INTDIR)\tag.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\tag.obj"	"$(INTDIR)\tag.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\tag.obj"	"$(INTDIR)\tag.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\tag.obj"	"$(INTDIR)\tag.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\tag.obj"	"$(INTDIR)\tag.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\tag.obj"	"$(INTDIR)\tag.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\tag.obj"	"$(INTDIR)\tag.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\tag.obj"	"$(INTDIR)\tag.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\tag.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\tag.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\trie.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\trie.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\trie.obj"	"$(INTDIR)\trie.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\trie.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\trie.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\trie.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\trie.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\trie.obj"	"$(INTDIR)\trie.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\trie.obj"	"$(INTDIR)\trie.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\trie.obj"	"$(INTDIR)\trie.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\trie.obj"	"$(INTDIR)\trie.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\trie.obj"	"$(INTDIR)\trie.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\trie.obj"	"$(INTDIR)\trie.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\trie.obj"	"$(INTDIR)\trie.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\trie.obj"	"$(INTDIR)\trie.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\trie.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\trie.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\ubi_BinTree.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\ubi_BinTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\ubi_BinTree.obj"	"$(INTDIR)\ubi_BinTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\ubi_BinTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\ubi_BinTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\ubi_BinTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\ubi_BinTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\ubi_BinTree.obj"	"$(INTDIR)\ubi_BinTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\ubi_BinTree.obj"	"$(INTDIR)\ubi_BinTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\ubi_BinTree.obj"	"$(INTDIR)\ubi_BinTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\ubi_BinTree.obj"	"$(INTDIR)\ubi_BinTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\ubi_BinTree.obj"	"$(INTDIR)\ubi_BinTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\ubi_BinTree.obj"	"$(INTDIR)\ubi_BinTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\ubi_BinTree.obj"	"$(INTDIR)\ubi_BinTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\ubi_BinTree.obj"	"$(INTDIR)\ubi_BinTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\ubi_BinTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\ubi_BinTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\ubi_SplayTree.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\ubi_SplayTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\ubi_SplayTree.obj"	"$(INTDIR)\ubi_SplayTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\ubi_SplayTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\ubi_SplayTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\ubi_SplayTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\ubi_SplayTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\ubi_SplayTree.obj"	"$(INTDIR)\ubi_SplayTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\ubi_SplayTree.obj"	"$(INTDIR)\ubi_SplayTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\ubi_SplayTree.obj"	"$(INTDIR)\ubi_SplayTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\ubi_SplayTree.obj"	"$(INTDIR)\ubi_SplayTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\ubi_SplayTree.obj"	"$(INTDIR)\ubi_SplayTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\ubi_SplayTree.obj"	"$(INTDIR)\ubi_SplayTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\ubi_SplayTree.obj"	"$(INTDIR)\ubi_SplayTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\ubi_SplayTree.obj"	"$(INTDIR)\ubi_SplayTree.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\ubi_SplayTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\ubi_SplayTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\util.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\util.obj"	"$(INTDIR)\util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\WIN32-Code\name.rc"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\name.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\name.res" /i "\cvsroot\snort\src\win32\WIN32-Code" /d "NDEBUG" $(SOURCE)


!ENDIF 

SOURCE="..\WIN32-Code\getopt.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\WIN32-Code\misc.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\misc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\misc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\misc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\misc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\misc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\misc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\misc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\WIN32-Code\syslog.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\syslog.obj"	"$(INTDIR)\syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\syslog.obj"	"$(INTDIR)\syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\syslog.obj"	"$(INTDIR)\syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\syslog.obj"	"$(INTDIR)\syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\syslog.obj"	"$(INTDIR)\syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\syslog.obj"	"$(INTDIR)\syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\syslog.obj"	"$(INTDIR)\syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\syslog.obj"	"$(INTDIR)\syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\syslog.obj"	"$(INTDIR)\syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\WIN32-Code\win32_service.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\win32_service.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\win32_service.obj"	"$(INTDIR)\win32_service.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\win32_service.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\win32_service.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\win32_service.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\win32_service.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\win32_service.obj"	"$(INTDIR)\win32_service.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\win32_service.obj"	"$(INTDIR)\win32_service.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\win32_service.obj"	"$(INTDIR)\win32_service.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\win32_service.obj"	"$(INTDIR)\win32_service.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\win32_service.obj"	"$(INTDIR)\win32_service.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\win32_service.obj"	"$(INTDIR)\win32_service.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\win32_service.obj"	"$(INTDIR)\win32_service.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\win32_service.obj"	"$(INTDIR)\win32_service.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\win32_service.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\win32_service.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_clientserver.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_clientserver.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_clientserver.obj"	"$(INTDIR)\sp_clientserver.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_clientserver.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_clientserver.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_clientserver.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_clientserver.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_clientserver.obj"	"$(INTDIR)\sp_clientserver.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_clientserver.obj"	"$(INTDIR)\sp_clientserver.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_clientserver.obj"	"$(INTDIR)\sp_clientserver.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_clientserver.obj"	"$(INTDIR)\sp_clientserver.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_clientserver.obj"	"$(INTDIR)\sp_clientserver.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_clientserver.obj"	"$(INTDIR)\sp_clientserver.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_clientserver.obj"	"$(INTDIR)\sp_clientserver.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_clientserver.obj"	"$(INTDIR)\sp_clientserver.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_clientserver.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_clientserver.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_dsize_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_dsize_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_dsize_check.obj"	"$(INTDIR)\sp_dsize_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_dsize_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_dsize_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_dsize_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_dsize_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_dsize_check.obj"	"$(INTDIR)\sp_dsize_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_dsize_check.obj"	"$(INTDIR)\sp_dsize_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_dsize_check.obj"	"$(INTDIR)\sp_dsize_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_dsize_check.obj"	"$(INTDIR)\sp_dsize_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_dsize_check.obj"	"$(INTDIR)\sp_dsize_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_dsize_check.obj"	"$(INTDIR)\sp_dsize_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_dsize_check.obj"	"$(INTDIR)\sp_dsize_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_dsize_check.obj"	"$(INTDIR)\sp_dsize_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_dsize_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_dsize_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_icmp_code_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_icmp_code_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_icmp_code_check.obj"	"$(INTDIR)\sp_icmp_code_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_icmp_code_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_icmp_code_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_icmp_code_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_icmp_code_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_icmp_code_check.obj"	"$(INTDIR)\sp_icmp_code_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_icmp_code_check.obj"	"$(INTDIR)\sp_icmp_code_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_icmp_code_check.obj"	"$(INTDIR)\sp_icmp_code_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_icmp_code_check.obj"	"$(INTDIR)\sp_icmp_code_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_icmp_code_check.obj"	"$(INTDIR)\sp_icmp_code_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_icmp_code_check.obj"	"$(INTDIR)\sp_icmp_code_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_icmp_code_check.obj"	"$(INTDIR)\sp_icmp_code_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_icmp_code_check.obj"	"$(INTDIR)\sp_icmp_code_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_icmp_code_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_icmp_code_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_icmp_id_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_icmp_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_icmp_id_check.obj"	"$(INTDIR)\sp_icmp_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_icmp_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_icmp_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_icmp_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_icmp_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_icmp_id_check.obj"	"$(INTDIR)\sp_icmp_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_icmp_id_check.obj"	"$(INTDIR)\sp_icmp_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_icmp_id_check.obj"	"$(INTDIR)\sp_icmp_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_icmp_id_check.obj"	"$(INTDIR)\sp_icmp_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_icmp_id_check.obj"	"$(INTDIR)\sp_icmp_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_icmp_id_check.obj"	"$(INTDIR)\sp_icmp_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_icmp_id_check.obj"	"$(INTDIR)\sp_icmp_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_icmp_id_check.obj"	"$(INTDIR)\sp_icmp_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_icmp_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_icmp_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_icmp_seq_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_icmp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_icmp_seq_check.obj"	"$(INTDIR)\sp_icmp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_icmp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_icmp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_icmp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_icmp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_icmp_seq_check.obj"	"$(INTDIR)\sp_icmp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_icmp_seq_check.obj"	"$(INTDIR)\sp_icmp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_icmp_seq_check.obj"	"$(INTDIR)\sp_icmp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_icmp_seq_check.obj"	"$(INTDIR)\sp_icmp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_icmp_seq_check.obj"	"$(INTDIR)\sp_icmp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_icmp_seq_check.obj"	"$(INTDIR)\sp_icmp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_icmp_seq_check.obj"	"$(INTDIR)\sp_icmp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_icmp_seq_check.obj"	"$(INTDIR)\sp_icmp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_icmp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_icmp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_icmp_type_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_icmp_type_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_icmp_type_check.obj"	"$(INTDIR)\sp_icmp_type_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_icmp_type_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_icmp_type_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_icmp_type_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_icmp_type_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_icmp_type_check.obj"	"$(INTDIR)\sp_icmp_type_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_icmp_type_check.obj"	"$(INTDIR)\sp_icmp_type_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_icmp_type_check.obj"	"$(INTDIR)\sp_icmp_type_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_icmp_type_check.obj"	"$(INTDIR)\sp_icmp_type_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_icmp_type_check.obj"	"$(INTDIR)\sp_icmp_type_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_icmp_type_check.obj"	"$(INTDIR)\sp_icmp_type_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_icmp_type_check.obj"	"$(INTDIR)\sp_icmp_type_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_icmp_type_check.obj"	"$(INTDIR)\sp_icmp_type_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_icmp_type_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_icmp_type_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_ip_fragbits.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_ip_fragbits.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_ip_fragbits.obj"	"$(INTDIR)\sp_ip_fragbits.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_ip_fragbits.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_ip_fragbits.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_ip_fragbits.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_ip_fragbits.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_ip_fragbits.obj"	"$(INTDIR)\sp_ip_fragbits.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_ip_fragbits.obj"	"$(INTDIR)\sp_ip_fragbits.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_ip_fragbits.obj"	"$(INTDIR)\sp_ip_fragbits.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_ip_fragbits.obj"	"$(INTDIR)\sp_ip_fragbits.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_ip_fragbits.obj"	"$(INTDIR)\sp_ip_fragbits.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_ip_fragbits.obj"	"$(INTDIR)\sp_ip_fragbits.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_ip_fragbits.obj"	"$(INTDIR)\sp_ip_fragbits.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_ip_fragbits.obj"	"$(INTDIR)\sp_ip_fragbits.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_ip_fragbits.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_ip_fragbits.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_ip_id_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_ip_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_ip_id_check.obj"	"$(INTDIR)\sp_ip_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_ip_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_ip_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_ip_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_ip_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_ip_id_check.obj"	"$(INTDIR)\sp_ip_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_ip_id_check.obj"	"$(INTDIR)\sp_ip_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_ip_id_check.obj"	"$(INTDIR)\sp_ip_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_ip_id_check.obj"	"$(INTDIR)\sp_ip_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_ip_id_check.obj"	"$(INTDIR)\sp_ip_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_ip_id_check.obj"	"$(INTDIR)\sp_ip_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_ip_id_check.obj"	"$(INTDIR)\sp_ip_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_ip_id_check.obj"	"$(INTDIR)\sp_ip_id_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_ip_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_ip_id_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_ip_proto.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_ip_proto.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_ip_proto.obj"	"$(INTDIR)\sp_ip_proto.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_ip_proto.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_ip_proto.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_ip_proto.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_ip_proto.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_ip_proto.obj"	"$(INTDIR)\sp_ip_proto.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_ip_proto.obj"	"$(INTDIR)\sp_ip_proto.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_ip_proto.obj"	"$(INTDIR)\sp_ip_proto.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_ip_proto.obj"	"$(INTDIR)\sp_ip_proto.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_ip_proto.obj"	"$(INTDIR)\sp_ip_proto.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_ip_proto.obj"	"$(INTDIR)\sp_ip_proto.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_ip_proto.obj"	"$(INTDIR)\sp_ip_proto.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_ip_proto.obj"	"$(INTDIR)\sp_ip_proto.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_ip_proto.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_ip_proto.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_ip_same_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_ip_same_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_ip_same_check.obj"	"$(INTDIR)\sp_ip_same_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_ip_same_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_ip_same_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_ip_same_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_ip_same_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_ip_same_check.obj"	"$(INTDIR)\sp_ip_same_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_ip_same_check.obj"	"$(INTDIR)\sp_ip_same_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_ip_same_check.obj"	"$(INTDIR)\sp_ip_same_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_ip_same_check.obj"	"$(INTDIR)\sp_ip_same_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_ip_same_check.obj"	"$(INTDIR)\sp_ip_same_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_ip_same_check.obj"	"$(INTDIR)\sp_ip_same_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_ip_same_check.obj"	"$(INTDIR)\sp_ip_same_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_ip_same_check.obj"	"$(INTDIR)\sp_ip_same_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_ip_same_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_ip_same_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_ip_tos_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_ip_tos_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_ip_tos_check.obj"	"$(INTDIR)\sp_ip_tos_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_ip_tos_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_ip_tos_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_ip_tos_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_ip_tos_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_ip_tos_check.obj"	"$(INTDIR)\sp_ip_tos_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_ip_tos_check.obj"	"$(INTDIR)\sp_ip_tos_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_ip_tos_check.obj"	"$(INTDIR)\sp_ip_tos_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_ip_tos_check.obj"	"$(INTDIR)\sp_ip_tos_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_ip_tos_check.obj"	"$(INTDIR)\sp_ip_tos_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_ip_tos_check.obj"	"$(INTDIR)\sp_ip_tos_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_ip_tos_check.obj"	"$(INTDIR)\sp_ip_tos_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_ip_tos_check.obj"	"$(INTDIR)\sp_ip_tos_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_ip_tos_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_ip_tos_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_ipoption_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_ipoption_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_ipoption_check.obj"	"$(INTDIR)\sp_ipoption_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_ipoption_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_ipoption_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_ipoption_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_ipoption_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_ipoption_check.obj"	"$(INTDIR)\sp_ipoption_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_ipoption_check.obj"	"$(INTDIR)\sp_ipoption_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_ipoption_check.obj"	"$(INTDIR)\sp_ipoption_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_ipoption_check.obj"	"$(INTDIR)\sp_ipoption_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_ipoption_check.obj"	"$(INTDIR)\sp_ipoption_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_ipoption_check.obj"	"$(INTDIR)\sp_ipoption_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_ipoption_check.obj"	"$(INTDIR)\sp_ipoption_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_ipoption_check.obj"	"$(INTDIR)\sp_ipoption_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_ipoption_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_ipoption_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_pattern_match.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_pattern_match.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_pattern_match.obj"	"$(INTDIR)\sp_pattern_match.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_pattern_match.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_pattern_match.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_pattern_match.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_pattern_match.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_pattern_match.obj"	"$(INTDIR)\sp_pattern_match.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_pattern_match.obj"	"$(INTDIR)\sp_pattern_match.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_pattern_match.obj"	"$(INTDIR)\sp_pattern_match.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_pattern_match.obj"	"$(INTDIR)\sp_pattern_match.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_pattern_match.obj"	"$(INTDIR)\sp_pattern_match.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_pattern_match.obj"	"$(INTDIR)\sp_pattern_match.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_pattern_match.obj"	"$(INTDIR)\sp_pattern_match.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_pattern_match.obj"	"$(INTDIR)\sp_pattern_match.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_pattern_match.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_pattern_match.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_priority.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_priority.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_priority.obj"	"$(INTDIR)\sp_priority.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_priority.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_priority.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_priority.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_priority.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_priority.obj"	"$(INTDIR)\sp_priority.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_priority.obj"	"$(INTDIR)\sp_priority.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_priority.obj"	"$(INTDIR)\sp_priority.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_priority.obj"	"$(INTDIR)\sp_priority.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_priority.obj"	"$(INTDIR)\sp_priority.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_priority.obj"	"$(INTDIR)\sp_priority.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_priority.obj"	"$(INTDIR)\sp_priority.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_priority.obj"	"$(INTDIR)\sp_priority.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_priority.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_priority.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_react.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_react.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_react.obj"	"$(INTDIR)\sp_react.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_react.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_react.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_react.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_react.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_react.obj"	"$(INTDIR)\sp_react.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_react.obj"	"$(INTDIR)\sp_react.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_react.obj"	"$(INTDIR)\sp_react.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_react.obj"	"$(INTDIR)\sp_react.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_react.obj"	"$(INTDIR)\sp_react.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_react.obj"	"$(INTDIR)\sp_react.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_react.obj"	"$(INTDIR)\sp_react.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_react.obj"	"$(INTDIR)\sp_react.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_react.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_react.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_reference.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_reference.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_reference.obj"	"$(INTDIR)\sp_reference.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_reference.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_reference.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_reference.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_reference.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_reference.obj"	"$(INTDIR)\sp_reference.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_reference.obj"	"$(INTDIR)\sp_reference.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_reference.obj"	"$(INTDIR)\sp_reference.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_reference.obj"	"$(INTDIR)\sp_reference.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_reference.obj"	"$(INTDIR)\sp_reference.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_reference.obj"	"$(INTDIR)\sp_reference.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_reference.obj"	"$(INTDIR)\sp_reference.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_reference.obj"	"$(INTDIR)\sp_reference.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_reference.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_reference.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_respond.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_respond.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_respond.obj"	"$(INTDIR)\sp_respond.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_respond.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_respond.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_respond.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_respond.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_respond.obj"	"$(INTDIR)\sp_respond.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_respond.obj"	"$(INTDIR)\sp_respond.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_respond.obj"	"$(INTDIR)\sp_respond.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_respond.obj"	"$(INTDIR)\sp_respond.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_respond.obj"	"$(INTDIR)\sp_respond.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_respond.obj"	"$(INTDIR)\sp_respond.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_respond.obj"	"$(INTDIR)\sp_respond.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_respond.obj"	"$(INTDIR)\sp_respond.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_respond.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_respond.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_rpc_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_rpc_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_rpc_check.obj"	"$(INTDIR)\sp_rpc_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_rpc_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_rpc_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_rpc_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_rpc_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_rpc_check.obj"	"$(INTDIR)\sp_rpc_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_rpc_check.obj"	"$(INTDIR)\sp_rpc_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_rpc_check.obj"	"$(INTDIR)\sp_rpc_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_rpc_check.obj"	"$(INTDIR)\sp_rpc_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_rpc_check.obj"	"$(INTDIR)\sp_rpc_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_rpc_check.obj"	"$(INTDIR)\sp_rpc_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_rpc_check.obj"	"$(INTDIR)\sp_rpc_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_rpc_check.obj"	"$(INTDIR)\sp_rpc_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_rpc_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_rpc_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_session.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_session.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_session.obj"	"$(INTDIR)\sp_session.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_session.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_session.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_session.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_session.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_session.obj"	"$(INTDIR)\sp_session.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_session.obj"	"$(INTDIR)\sp_session.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_session.obj"	"$(INTDIR)\sp_session.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_session.obj"	"$(INTDIR)\sp_session.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_session.obj"	"$(INTDIR)\sp_session.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_session.obj"	"$(INTDIR)\sp_session.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_session.obj"	"$(INTDIR)\sp_session.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_session.obj"	"$(INTDIR)\sp_session.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_session.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_session.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_tcp_ack_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_tcp_ack_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_tcp_ack_check.obj"	"$(INTDIR)\sp_tcp_ack_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_tcp_ack_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_tcp_ack_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_tcp_ack_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_tcp_ack_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_tcp_ack_check.obj"	"$(INTDIR)\sp_tcp_ack_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_tcp_ack_check.obj"	"$(INTDIR)\sp_tcp_ack_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_tcp_ack_check.obj"	"$(INTDIR)\sp_tcp_ack_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_tcp_ack_check.obj"	"$(INTDIR)\sp_tcp_ack_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_tcp_ack_check.obj"	"$(INTDIR)\sp_tcp_ack_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_tcp_ack_check.obj"	"$(INTDIR)\sp_tcp_ack_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_tcp_ack_check.obj"	"$(INTDIR)\sp_tcp_ack_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_tcp_ack_check.obj"	"$(INTDIR)\sp_tcp_ack_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_tcp_ack_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_tcp_ack_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_tcp_flag_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_tcp_flag_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_tcp_flag_check.obj"	"$(INTDIR)\sp_tcp_flag_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_tcp_flag_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_tcp_flag_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_tcp_flag_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_tcp_flag_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_tcp_flag_check.obj"	"$(INTDIR)\sp_tcp_flag_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_tcp_flag_check.obj"	"$(INTDIR)\sp_tcp_flag_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_tcp_flag_check.obj"	"$(INTDIR)\sp_tcp_flag_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_tcp_flag_check.obj"	"$(INTDIR)\sp_tcp_flag_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_tcp_flag_check.obj"	"$(INTDIR)\sp_tcp_flag_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_tcp_flag_check.obj"	"$(INTDIR)\sp_tcp_flag_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_tcp_flag_check.obj"	"$(INTDIR)\sp_tcp_flag_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_tcp_flag_check.obj"	"$(INTDIR)\sp_tcp_flag_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_tcp_flag_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_tcp_flag_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_tcp_seq_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_tcp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_tcp_seq_check.obj"	"$(INTDIR)\sp_tcp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_tcp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_tcp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_tcp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_tcp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_tcp_seq_check.obj"	"$(INTDIR)\sp_tcp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_tcp_seq_check.obj"	"$(INTDIR)\sp_tcp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_tcp_seq_check.obj"	"$(INTDIR)\sp_tcp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_tcp_seq_check.obj"	"$(INTDIR)\sp_tcp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_tcp_seq_check.obj"	"$(INTDIR)\sp_tcp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_tcp_seq_check.obj"	"$(INTDIR)\sp_tcp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_tcp_seq_check.obj"	"$(INTDIR)\sp_tcp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_tcp_seq_check.obj"	"$(INTDIR)\sp_tcp_seq_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_tcp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_tcp_seq_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_tcp_win_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_tcp_win_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_tcp_win_check.obj"	"$(INTDIR)\sp_tcp_win_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_tcp_win_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_tcp_win_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_tcp_win_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_tcp_win_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_tcp_win_check.obj"	"$(INTDIR)\sp_tcp_win_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_tcp_win_check.obj"	"$(INTDIR)\sp_tcp_win_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_tcp_win_check.obj"	"$(INTDIR)\sp_tcp_win_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_tcp_win_check.obj"	"$(INTDIR)\sp_tcp_win_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_tcp_win_check.obj"	"$(INTDIR)\sp_tcp_win_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_tcp_win_check.obj"	"$(INTDIR)\sp_tcp_win_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_tcp_win_check.obj"	"$(INTDIR)\sp_tcp_win_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_tcp_win_check.obj"	"$(INTDIR)\sp_tcp_win_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_tcp_win_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_tcp_win_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\detection-plugins\sp_ttl_check.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\sp_ttl_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\sp_ttl_check.obj"	"$(INTDIR)\sp_ttl_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\sp_ttl_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\sp_ttl_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\sp_ttl_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\sp_ttl_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\sp_ttl_check.obj"	"$(INTDIR)\sp_ttl_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\sp_ttl_check.obj"	"$(INTDIR)\sp_ttl_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\sp_ttl_check.obj"	"$(INTDIR)\sp_ttl_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\sp_ttl_check.obj"	"$(INTDIR)\sp_ttl_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\sp_ttl_check.obj"	"$(INTDIR)\sp_ttl_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\sp_ttl_check.obj"	"$(INTDIR)\sp_ttl_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\sp_ttl_check.obj"	"$(INTDIR)\sp_ttl_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\sp_ttl_check.obj"	"$(INTDIR)\sp_ttl_check.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\sp_ttl_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\sp_ttl_check.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_alert_fast.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_alert_fast.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_alert_fast.obj"	"$(INTDIR)\spo_alert_fast.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_alert_fast.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_alert_fast.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_alert_fast.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_alert_fast.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_alert_fast.obj"	"$(INTDIR)\spo_alert_fast.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_alert_fast.obj"	"$(INTDIR)\spo_alert_fast.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_alert_fast.obj"	"$(INTDIR)\spo_alert_fast.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_alert_fast.obj"	"$(INTDIR)\spo_alert_fast.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_alert_fast.obj"	"$(INTDIR)\spo_alert_fast.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_alert_fast.obj"	"$(INTDIR)\spo_alert_fast.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_alert_fast.obj"	"$(INTDIR)\spo_alert_fast.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_alert_fast.obj"	"$(INTDIR)\spo_alert_fast.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_alert_fast.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_alert_fast.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_alert_full.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_alert_full.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_alert_full.obj"	"$(INTDIR)\spo_alert_full.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_alert_full.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_alert_full.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_alert_full.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_alert_full.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_alert_full.obj"	"$(INTDIR)\spo_alert_full.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_alert_full.obj"	"$(INTDIR)\spo_alert_full.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_alert_full.obj"	"$(INTDIR)\spo_alert_full.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_alert_full.obj"	"$(INTDIR)\spo_alert_full.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_alert_full.obj"	"$(INTDIR)\spo_alert_full.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_alert_full.obj"	"$(INTDIR)\spo_alert_full.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_alert_full.obj"	"$(INTDIR)\spo_alert_full.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_alert_full.obj"	"$(INTDIR)\spo_alert_full.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_alert_full.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_alert_full.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_alert_smb.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_alert_smb.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_alert_smb.obj"	"$(INTDIR)\spo_alert_smb.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_alert_smb.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_alert_smb.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_alert_smb.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_alert_smb.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_alert_smb.obj"	"$(INTDIR)\spo_alert_smb.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_alert_smb.obj"	"$(INTDIR)\spo_alert_smb.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_alert_smb.obj"	"$(INTDIR)\spo_alert_smb.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_alert_smb.obj"	"$(INTDIR)\spo_alert_smb.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_alert_smb.obj"	"$(INTDIR)\spo_alert_smb.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_alert_smb.obj"	"$(INTDIR)\spo_alert_smb.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_alert_smb.obj"	"$(INTDIR)\spo_alert_smb.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_alert_smb.obj"	"$(INTDIR)\spo_alert_smb.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_alert_smb.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_alert_smb.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_alert_syslog.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_alert_syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_alert_syslog.obj"	"$(INTDIR)\spo_alert_syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_alert_syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_alert_syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_alert_syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_alert_syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_alert_syslog.obj"	"$(INTDIR)\spo_alert_syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_alert_syslog.obj"	"$(INTDIR)\spo_alert_syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_alert_syslog.obj"	"$(INTDIR)\spo_alert_syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_alert_syslog.obj"	"$(INTDIR)\spo_alert_syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_alert_syslog.obj"	"$(INTDIR)\spo_alert_syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_alert_syslog.obj"	"$(INTDIR)\spo_alert_syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_alert_syslog.obj"	"$(INTDIR)\spo_alert_syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_alert_syslog.obj"	"$(INTDIR)\spo_alert_syslog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_alert_syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_alert_syslog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_alert_unixsock.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_alert_unixsock.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_alert_unixsock.obj"	"$(INTDIR)\spo_alert_unixsock.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_alert_unixsock.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_alert_unixsock.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_alert_unixsock.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_alert_unixsock.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_alert_unixsock.obj"	"$(INTDIR)\spo_alert_unixsock.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_alert_unixsock.obj"	"$(INTDIR)\spo_alert_unixsock.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_alert_unixsock.obj"	"$(INTDIR)\spo_alert_unixsock.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_alert_unixsock.obj"	"$(INTDIR)\spo_alert_unixsock.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_alert_unixsock.obj"	"$(INTDIR)\spo_alert_unixsock.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_alert_unixsock.obj"	"$(INTDIR)\spo_alert_unixsock.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_alert_unixsock.obj"	"$(INTDIR)\spo_alert_unixsock.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_alert_unixsock.obj"	"$(INTDIR)\spo_alert_unixsock.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_alert_unixsock.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_alert_unixsock.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_csv.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_csv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_csv.obj"	"$(INTDIR)\spo_csv.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_csv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_csv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_csv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_csv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_csv.obj"	"$(INTDIR)\spo_csv.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_csv.obj"	"$(INTDIR)\spo_csv.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_csv.obj"	"$(INTDIR)\spo_csv.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_csv.obj"	"$(INTDIR)\spo_csv.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_csv.obj"	"$(INTDIR)\spo_csv.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_csv.obj"	"$(INTDIR)\spo_csv.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_csv.obj"	"$(INTDIR)\spo_csv.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_csv.obj"	"$(INTDIR)\spo_csv.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_csv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_csv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_database.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_database.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_database.obj"	"$(INTDIR)\spo_database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_database.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_database.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_database.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_database.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_database.obj"	"$(INTDIR)\spo_database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_database.obj"	"$(INTDIR)\spo_database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_database.obj"	"$(INTDIR)\spo_database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_database.obj"	"$(INTDIR)\spo_database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_database.obj"	"$(INTDIR)\spo_database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_database.obj"	"$(INTDIR)\spo_database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_database.obj"	"$(INTDIR)\spo_database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_database.obj"	"$(INTDIR)\spo_database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_database.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_database.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_idmef.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_idmef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_idmef.obj"	"$(INTDIR)\spo_idmef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_idmef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_idmef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_idmef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_idmef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_idmef.obj"	"$(INTDIR)\spo_idmef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_idmef.obj"	"$(INTDIR)\spo_idmef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_idmef.obj"	"$(INTDIR)\spo_idmef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_idmef.obj"	"$(INTDIR)\spo_idmef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_idmef.obj"	"$(INTDIR)\spo_idmef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_idmef.obj"	"$(INTDIR)\spo_idmef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_idmef.obj"	"$(INTDIR)\spo_idmef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_idmef.obj"	"$(INTDIR)\spo_idmef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_idmef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_idmef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_log_ascii.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_log_ascii.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_log_ascii.obj"	"$(INTDIR)\spo_log_ascii.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_log_ascii.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_log_ascii.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_log_ascii.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_log_ascii.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_log_ascii.obj"	"$(INTDIR)\spo_log_ascii.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_log_ascii.obj"	"$(INTDIR)\spo_log_ascii.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_log_ascii.obj"	"$(INTDIR)\spo_log_ascii.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_log_ascii.obj"	"$(INTDIR)\spo_log_ascii.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_log_ascii.obj"	"$(INTDIR)\spo_log_ascii.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_log_ascii.obj"	"$(INTDIR)\spo_log_ascii.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_log_ascii.obj"	"$(INTDIR)\spo_log_ascii.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_log_ascii.obj"	"$(INTDIR)\spo_log_ascii.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_log_ascii.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_log_ascii.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_log_null.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_log_null.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_log_null.obj"	"$(INTDIR)\spo_log_null.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_log_null.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_log_null.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_log_null.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_log_null.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_log_null.obj"	"$(INTDIR)\spo_log_null.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_log_null.obj"	"$(INTDIR)\spo_log_null.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_log_null.obj"	"$(INTDIR)\spo_log_null.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_log_null.obj"	"$(INTDIR)\spo_log_null.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_log_null.obj"	"$(INTDIR)\spo_log_null.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_log_null.obj"	"$(INTDIR)\spo_log_null.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_log_null.obj"	"$(INTDIR)\spo_log_null.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_log_null.obj"	"$(INTDIR)\spo_log_null.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_log_null.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_log_null.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_log_tcpdump.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_log_tcpdump.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_log_tcpdump.obj"	"$(INTDIR)\spo_log_tcpdump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_log_tcpdump.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_log_tcpdump.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_log_tcpdump.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_log_tcpdump.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_log_tcpdump.obj"	"$(INTDIR)\spo_log_tcpdump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_log_tcpdump.obj"	"$(INTDIR)\spo_log_tcpdump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_log_tcpdump.obj"	"$(INTDIR)\spo_log_tcpdump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_log_tcpdump.obj"	"$(INTDIR)\spo_log_tcpdump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_log_tcpdump.obj"	"$(INTDIR)\spo_log_tcpdump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_log_tcpdump.obj"	"$(INTDIR)\spo_log_tcpdump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_log_tcpdump.obj"	"$(INTDIR)\spo_log_tcpdump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_log_tcpdump.obj"	"$(INTDIR)\spo_log_tcpdump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_log_tcpdump.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_log_tcpdump.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_SnmpTrap.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_SnmpTrap.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_SnmpTrap.obj"	"$(INTDIR)\spo_SnmpTrap.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_SnmpTrap.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_SnmpTrap.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_SnmpTrap.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_SnmpTrap.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_SnmpTrap.obj"	"$(INTDIR)\spo_SnmpTrap.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_SnmpTrap.obj"	"$(INTDIR)\spo_SnmpTrap.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_SnmpTrap.obj"	"$(INTDIR)\spo_SnmpTrap.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_SnmpTrap.obj"	"$(INTDIR)\spo_SnmpTrap.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_SnmpTrap.obj"	"$(INTDIR)\spo_SnmpTrap.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_SnmpTrap.obj"	"$(INTDIR)\spo_SnmpTrap.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_SnmpTrap.obj"	"$(INTDIR)\spo_SnmpTrap.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_SnmpTrap.obj"	"$(INTDIR)\spo_SnmpTrap.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_SnmpTrap.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_SnmpTrap.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_unified.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_unified.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_unified.obj"	"$(INTDIR)\spo_unified.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_unified.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_unified.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_unified.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_unified.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_unified.obj"	"$(INTDIR)\spo_unified.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_unified.obj"	"$(INTDIR)\spo_unified.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_unified.obj"	"$(INTDIR)\spo_unified.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_unified.obj"	"$(INTDIR)\spo_unified.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_unified.obj"	"$(INTDIR)\spo_unified.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_unified.obj"	"$(INTDIR)\spo_unified.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_unified.obj"	"$(INTDIR)\spo_unified.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_unified.obj"	"$(INTDIR)\spo_unified.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_unified.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_unified.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\..\output-plugins\spo_xml.c"

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spo_xml.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spo_xml.obj"	"$(INTDIR)\spo_xml.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spo_xml.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spo_xml.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spo_xml.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spo_xml.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spo_xml.obj"	"$(INTDIR)\spo_xml.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spo_xml.obj"	"$(INTDIR)\spo_xml.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spo_xml.obj"	"$(INTDIR)\spo_xml.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spo_xml.obj"	"$(INTDIR)\spo_xml.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spo_xml.obj"	"$(INTDIR)\spo_xml.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spo_xml.obj"	"$(INTDIR)\spo_xml.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spo_xml.obj"	"$(INTDIR)\spo_xml.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spo_xml.obj"	"$(INTDIR)\spo_xml.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spo_xml.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spo_xml.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_arpspoof.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_arpspoof.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_arpspoof.obj"	"$(INTDIR)\spp_arpspoof.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_arpspoof.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_arpspoof.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_arpspoof.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_arpspoof.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_arpspoof.obj"	"$(INTDIR)\spp_arpspoof.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_arpspoof.obj"	"$(INTDIR)\spp_arpspoof.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_arpspoof.obj"	"$(INTDIR)\spp_arpspoof.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_arpspoof.obj"	"$(INTDIR)\spp_arpspoof.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_arpspoof.obj"	"$(INTDIR)\spp_arpspoof.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_arpspoof.obj"	"$(INTDIR)\spp_arpspoof.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_arpspoof.obj"	"$(INTDIR)\spp_arpspoof.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_arpspoof.obj"	"$(INTDIR)\spp_arpspoof.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_arpspoof.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_arpspoof.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_asn1.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_asn1.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_asn1.obj"	"$(INTDIR)\spp_asn1.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_asn1.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_asn1.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_asn1.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_asn1.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_asn1.obj"	"$(INTDIR)\spp_asn1.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_asn1.obj"	"$(INTDIR)\spp_asn1.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_asn1.obj"	"$(INTDIR)\spp_asn1.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_asn1.obj"	"$(INTDIR)\spp_asn1.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_asn1.obj"	"$(INTDIR)\spp_asn1.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_asn1.obj"	"$(INTDIR)\spp_asn1.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_asn1.obj"	"$(INTDIR)\spp_asn1.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_asn1.obj"	"$(INTDIR)\spp_asn1.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_asn1.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_asn1.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_bo.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_bo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_bo.obj"	"$(INTDIR)\spp_bo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_bo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_bo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_bo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_bo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_bo.obj"	"$(INTDIR)\spp_bo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_bo.obj"	"$(INTDIR)\spp_bo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_bo.obj"	"$(INTDIR)\spp_bo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_bo.obj"	"$(INTDIR)\spp_bo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_bo.obj"	"$(INTDIR)\spp_bo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_bo.obj"	"$(INTDIR)\spp_bo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_bo.obj"	"$(INTDIR)\spp_bo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_bo.obj"	"$(INTDIR)\spp_bo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_bo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_bo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_conversation.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_conversation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_conversation.obj"	"$(INTDIR)\spp_conversation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_conversation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_conversation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_conversation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_conversation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_conversation.obj"	"$(INTDIR)\spp_conversation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_conversation.obj"	"$(INTDIR)\spp_conversation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_conversation.obj"	"$(INTDIR)\spp_conversation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_conversation.obj"	"$(INTDIR)\spp_conversation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_conversation.obj"	"$(INTDIR)\spp_conversation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_conversation.obj"	"$(INTDIR)\spp_conversation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_conversation.obj"	"$(INTDIR)\spp_conversation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_conversation.obj"	"$(INTDIR)\spp_conversation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_conversation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_conversation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_fnord.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_fnord.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_fnord.obj"	"$(INTDIR)\spp_fnord.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_fnord.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_fnord.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_fnord.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_fnord.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_fnord.obj"	"$(INTDIR)\spp_fnord.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_fnord.obj"	"$(INTDIR)\spp_fnord.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_fnord.obj"	"$(INTDIR)\spp_fnord.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_fnord.obj"	"$(INTDIR)\spp_fnord.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_fnord.obj"	"$(INTDIR)\spp_fnord.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_fnord.obj"	"$(INTDIR)\spp_fnord.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_fnord.obj"	"$(INTDIR)\spp_fnord.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_fnord.obj"	"$(INTDIR)\spp_fnord.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_fnord.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_fnord.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_frag2.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_frag2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_frag2.obj"	"$(INTDIR)\spp_frag2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_frag2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_frag2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_frag2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_frag2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_frag2.obj"	"$(INTDIR)\spp_frag2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_frag2.obj"	"$(INTDIR)\spp_frag2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_frag2.obj"	"$(INTDIR)\spp_frag2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_frag2.obj"	"$(INTDIR)\spp_frag2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_frag2.obj"	"$(INTDIR)\spp_frag2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_frag2.obj"	"$(INTDIR)\spp_frag2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_frag2.obj"	"$(INTDIR)\spp_frag2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_frag2.obj"	"$(INTDIR)\spp_frag2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_frag2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_frag2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_http_decode.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_http_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_http_decode.obj"	"$(INTDIR)\spp_http_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_http_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_http_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_http_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_http_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_http_decode.obj"	"$(INTDIR)\spp_http_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_http_decode.obj"	"$(INTDIR)\spp_http_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_http_decode.obj"	"$(INTDIR)\spp_http_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_http_decode.obj"	"$(INTDIR)\spp_http_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_http_decode.obj"	"$(INTDIR)\spp_http_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_http_decode.obj"	"$(INTDIR)\spp_http_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_http_decode.obj"	"$(INTDIR)\spp_http_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_http_decode.obj"	"$(INTDIR)\spp_http_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_http_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_http_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_portscan.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_portscan.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_portscan.obj"	"$(INTDIR)\spp_portscan.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_portscan.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_portscan.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_portscan.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_portscan.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_portscan.obj"	"$(INTDIR)\spp_portscan.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_portscan.obj"	"$(INTDIR)\spp_portscan.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_portscan.obj"	"$(INTDIR)\spp_portscan.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_portscan.obj"	"$(INTDIR)\spp_portscan.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_portscan.obj"	"$(INTDIR)\spp_portscan.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_portscan.obj"	"$(INTDIR)\spp_portscan.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_portscan.obj"	"$(INTDIR)\spp_portscan.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_portscan.obj"	"$(INTDIR)\spp_portscan.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_portscan.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_portscan.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_portscan2.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_portscan2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_portscan2.obj"	"$(INTDIR)\spp_portscan2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_portscan2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_portscan2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_portscan2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_portscan2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_portscan2.obj"	"$(INTDIR)\spp_portscan2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_portscan2.obj"	"$(INTDIR)\spp_portscan2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_portscan2.obj"	"$(INTDIR)\spp_portscan2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_portscan2.obj"	"$(INTDIR)\spp_portscan2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_portscan2.obj"	"$(INTDIR)\spp_portscan2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_portscan2.obj"	"$(INTDIR)\spp_portscan2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_portscan2.obj"	"$(INTDIR)\spp_portscan2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_portscan2.obj"	"$(INTDIR)\spp_portscan2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_portscan2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_portscan2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_rpc_decode.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_rpc_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_rpc_decode.obj"	"$(INTDIR)\spp_rpc_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_rpc_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_rpc_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_rpc_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_rpc_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_rpc_decode.obj"	"$(INTDIR)\spp_rpc_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_rpc_decode.obj"	"$(INTDIR)\spp_rpc_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_rpc_decode.obj"	"$(INTDIR)\spp_rpc_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_rpc_decode.obj"	"$(INTDIR)\spp_rpc_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_rpc_decode.obj"	"$(INTDIR)\spp_rpc_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_rpc_decode.obj"	"$(INTDIR)\spp_rpc_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_rpc_decode.obj"	"$(INTDIR)\spp_rpc_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_rpc_decode.obj"	"$(INTDIR)\spp_rpc_decode.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_rpc_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_rpc_decode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_stream4.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_stream4.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_stream4.obj"	"$(INTDIR)\spp_stream4.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_stream4.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_stream4.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_stream4.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_stream4.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_stream4.obj"	"$(INTDIR)\spp_stream4.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_stream4.obj"	"$(INTDIR)\spp_stream4.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_stream4.obj"	"$(INTDIR)\spp_stream4.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_stream4.obj"	"$(INTDIR)\spp_stream4.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_stream4.obj"	"$(INTDIR)\spp_stream4.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_stream4.obj"	"$(INTDIR)\spp_stream4.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_stream4.obj"	"$(INTDIR)\spp_stream4.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_stream4.obj"	"$(INTDIR)\spp_stream4.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_stream4.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_stream4.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\preprocessors\spp_telnet_negotiation.c

!IF  "$(CFG)" == "snort - Win32 StdDB Debug"


"$(INTDIR)\spp_telnet_negotiation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Release"


"$(INTDIR)\spp_telnet_negotiation.obj"	"$(INTDIR)\spp_telnet_negotiation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Debug"


"$(INTDIR)\spp_telnet_negotiation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Release"


"$(INTDIR)\spp_telnet_negotiation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Debug"


"$(INTDIR)\spp_telnet_negotiation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB FlexResp Service Release"


"$(INTDIR)\spp_telnet_negotiation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Debug"


"$(INTDIR)\spp_telnet_negotiation.obj"	"$(INTDIR)\spp_telnet_negotiation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Release"


"$(INTDIR)\spp_telnet_negotiation.obj"	"$(INTDIR)\spp_telnet_negotiation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Debug"


"$(INTDIR)\spp_telnet_negotiation.obj"	"$(INTDIR)\spp_telnet_negotiation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL Service Release"


"$(INTDIR)\spp_telnet_negotiation.obj"	"$(INTDIR)\spp_telnet_negotiation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Debug"


"$(INTDIR)\spp_telnet_negotiation.obj"	"$(INTDIR)\spp_telnet_negotiation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Release"


"$(INTDIR)\spp_telnet_negotiation.obj"	"$(INTDIR)\spp_telnet_negotiation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Debug"


"$(INTDIR)\spp_telnet_negotiation.obj"	"$(INTDIR)\spp_telnet_negotiation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB MSSQL FlexResp Service Release"


"$(INTDIR)\spp_telnet_negotiation.obj"	"$(INTDIR)\spp_telnet_negotiation.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Debug"


"$(INTDIR)\spp_telnet_negotiation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "snort - Win32 StdDB Service Release"


"$(INTDIR)\spp_telnet_negotiation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

