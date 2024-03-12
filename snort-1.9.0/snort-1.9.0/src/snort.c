/* $Id: snort.c,v 1.157 2002/09/25 19:56:53 chrisgreen Exp $ */
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

/*
 *
 * Program: Snort
 *
 * Purpose: Check out the README file for info on what you can do
 *          with Snort.
 *
 * Author: Martin Roesch (roesch@clark.net)
 *
 * Comments: Ideas and code stolen liberally from Mike Borella's IP Grab
 *           program. Check out his stuff at http://www.borella.net.  I
 *           also have ripped some util functions from TCPdump, plus Mike's
 *           prog is derived from it as well.  All hail TCPdump....
 *
 */

/*  I N C L U D E S  **********************************************************/
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
#ifndef WIN32
#include <grp.h>
#include <pwd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#endif  /* !WIN32 */

#include "snort.h"
#include "rules.h"
#include "plugbase.h"
#include "signal.h"
#include "debug.h"
#include "util.h"
#include "parser.h"
#include "tag.h"
#include "log.h"
#include "detect.h"
#include "mstring.h"


/*  G L O B A L S  ************************************************************/
extern OutputFuncNode *AlertList;
extern OutputFuncNode *LogList;
/*extern char *malloc_options;*/

/*
 *
 * Function: main(int, char *)
 *
 * Purpose:  Handle program entry and exit, call main prog sections
 *           This can handle both regular (command-line) style
 *           startup, as well as Win32 Service style startup.
 *
 * Arguments: See command line args in README file
 *
 * Returns: 0 => normal exit, 1 => exit on error
 *
 */
int main(int argc, char* argv[]) 
{
#if defined(WIN32) && defined(ENABLE_WIN32_SERVICE)
    /* If the first parameter is "/SERVICE", then start Snort as a Win32 service */
    if( argc>1 && _stricmp(argv[1],SERVICE_CMDLINE_PARAM)==0)
    {
        return SnortServiceMain(argc, argv);
    }
#endif /* WIN32 && ENABLE_WIN32_SERVICE */

    return SnortMain(argc,argv);
}




/*
 *
 * Function: SnortMain(int, char *)
 *
 * Purpose:  The real place that the program handles entry and exit.  Called
 *           called by main(), or by SnortServiceMain().
 *
 * Arguments: See command line args in README file
 *
 * Returns: 0 => normal exit, 1 => exit on error
 *
 */
int SnortMain(int argc, char *argv[])
{
#ifdef USE_PTHREADS
    int i;

#endif
#ifndef WIN32
    #if defined(LINUX) || defined(FREEBSD) || defined(OPENBSD) || defined(SOLARIS)
        sigset_t set;

        sigemptyset(&set);
        sigprocmask(SIG_SETMASK, &set, NULL);
    #else
        sigsetmask(0);
    #endif
#endif  /* !WIN32 */

    /*    malloc_options = "AX";*/

    /* make this prog behave nicely when signals come along */
    signal(SIGTERM, CleanExit);
    signal(SIGINT, CleanExit);
    signal(SIGQUIT, CleanExit);
    signal(SIGHUP, CleanExit);
    signal(SIGUSR1, SigUSR1Wrap);

    /*
     * set a global ptr to the program name so other functions can tell what
     * the program name is
     */
    progname = argv[0];
    progargs = argv;

#ifdef WIN32
    if (!init_winsock())
        FatalError("[!] ERROR: Could not Initialize Winsock!\n");
#endif

    /*
     * setup some lookup data structs
     */
    InitNetmasks();
    InitProtoNames();
    InitOutputPlugins();

    /* initialize the packet counter to loop forever */
    pv.pkt_cnt = -1;

    /* set the alert filename to NULL */
    pv.alert_filename = NULL;

    /* set the default alert mode */
    pv.alert_mode = ALERT_FULL;

    /* set the default assurance mode (used with stream 4) */
    pv.assurance_mode = ASSURE_ALL;

    pv.use_utc = 0;

    /*
     * provide (limited) status messages by default
     */
    pv.quiet_flag = 0;

    /* turn on decoder alerts by default -- useful for bug reports.. */
    pv.decode_alert_flag = 1;
    
    /* turn on checksum verification by default */
    pv.checksums_mode = DO_IP_CHECKSUMS | DO_TCP_CHECKSUMS |
                        DO_UDP_CHECKSUMS | DO_ICMP_CHECKSUMS;

    ifr_count = 0;

#if defined(WIN32) && defined(ENABLE_WIN32_SERVICE)
    /* initialize flags which control the Win32 service */
    pv.terminate_service_flag = 0;
    pv.pause_service_flag = 0;
#endif  /* WIN32 && ENABLE_WIN32_SERVICE */

#ifdef USE_PTHREADS
    pt_lock = PTHREAD_MUTEX_INITIALIZER;
#endif

    /* set the default logging directory just for shits and giggles */
    strlcpy(pv.log_dir, DEFAULT_LOG_DIR, STD_BUF);

    /* chew up the command line */
    ParseCmdLine(argc, argv);

    /* if the logging flag hasn't been set yet... */
    if(!pv.log_flag)
    {
        /* ...set the default logging dir */
        strlcpy(pv.log_dir, DEFAULT_LOG_DIR, STD_BUF);
    }

    if(!pv.quiet_flag)
    {
        LogMessage("Log directory = %s\n", pv.log_dir);
    }

    /*
     * if no interfaces were specified we would need one anyway
     */
    if(!ifr_count)
        ifr_count++;

    /*
     * if we're not reading packets from a file, open the network interface
     * for reading.. (interfaces are being initalized before the config file
     * is read, so some plugins would be able to start up properly.
     */
    if(!pv.readmode_flag)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Opening interface: %s\n", PRINT_INTERFACE(pv.interfaces[0])););
        /* open up our libpcap packet capture interface */
        InitializeInterfaces();
    }
    else
    {
        DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Opening file: %s\n", pv.readfile););

        /* open the packet file for readback */
        OpenPcap(pv.readfile, 0);
    }

    /* didn't get any conf data at the command line, try to find the default
     * conf file
     */ 

    if(!pv.use_rules && !pv.verbose_flag && !pv.log_flag)
    {
        ReadConfFile();
    }

    if(pv.use_utc == 1)
    {
        thiszone = 0;
    }
    else
    {
        /* set the timezone (ripped from tcpdump) */
        thiszone = gmt2local(0);
    }

    if(!pv.quiet_flag)
    {
        LogMessage("\n        --== Initializing Snort ==--\n");
    }

    if(pv.use_rules && pv.rules_order_flag)
    {
        if(!pv.quiet_flag)
        {
            LogMessage("Rule application order changed to Pass->Alert->Log\n");
        }
    }

    /*
     * we're not using rules, sniffing to the screen, or logging packets so
     * we don't really need to run...
     */
    if(!pv.use_rules && !pv.verbose_flag && !pv.log_flag)
    {
        /*
         * give them a nice little reminder that Snort needs to be told what
         * to do
         */
        DisplayBanner();
        ShowUsage(progname);
        PrintError("\n\nUh, you need to tell me to do something....\n\n");
        exit(0);
    }

    /*
     * if daemon mode requested, fork daemon first, otherwise on linux
     * interface will be reset.
     */
    if(pv.daemon_flag)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Entering daemon mode\n"););
        GoDaemon();
    }

    
    /*
     * creating a PID file before setting its proper
     * path (in SanityChecks()) is not a good idea
     *
     * -- cmg -- 
     * CHANGE: SanityChecks has nothing to do with pid file paths.
     * all of that is done in CreatePidFile
     *
     */
    if(pv.use_rules || pv.log_flag || pv.daemon_flag || *pv.pidfile_suffix)
    {
        if(!pv.nolog_flag && 
	   (pv.alert_mode == ALERT_FAST ||
	    pv.alert_mode == ALERT_FULL ||
	    pv.alert_mode == 0))   
        {
            /* perform some sanity checks on the output directory
	       TODO: rename this function -- it only checks logoutput dir.
             */
            SanityChecks();
        }

        /* ... then create a PID file if not reading from a file */
        if (!pv.readmode_flag && (pv.daemon_flag || *pv.pidfile_suffix))
	{
#ifndef WIN32
            CreatePidFile(pv.interfaces[0]);
#else
	    CreatePidFile("WIN32");
#endif
	}
    }

#ifndef WIN32
    /* Don't need root privs anymore, so lets drop ownership
     * and chroot if requested....
     */

    if(chrootdir != NULL)
    {
        if(chdir(chrootdir) < 0)
            FatalError("Can not chdir to \"%s\"\n", chrootdir);
        if(chroot(chrootdir) < 0)
            FatalError("Can not chroot to %s\n", chrootdir);
        if(chdir("/") < 0)
            FatalError("Can not chdir to \"/\"\n");

        free(chrootdir);
        chrootdir = NULL;        /* we don't need chrootdir anymore so all
                                  * other routines should use fullpath. */
    }
#endif  /* WIN32 */

    DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Setting Packet Processor\n"););

    /* set the packet processor (ethernet, slip, t/r, etc ) */
    SetPktProcessors();

    /* Drop privelegies if requested, when initialisation is done */
    SetUidGid();

    /* if we're using the rules system, it gets initialized here */
    if(pv.use_rules && !conf_done)
    {
        SanityChecks();

        /* initialize all the plugin modules */
        InitPreprocessors();
        InitPlugIns();
        //InitOutputPlugins();
        InitTag();

#ifdef DEBUG
        DumpPreprocessors();
        DumpPlugIns();
        DumpOutputPlugins();
#endif

        /* setup the default rule action anchor points */
        CreateDefaultRules();

        if(pv.rules_order_flag)
        {
            OrderRuleLists("pass activation dynamic alert log");
        }

        if(!pv.quiet_flag)
            LogMessage("Parsing Rules file %s\n", pv.config_file);

        ParseRulesFile(pv.config_file, 0);

        if(!pv.quiet_flag)
        {
            printRuleOrder();
        }
    }
    if(!pv.quiet_flag)
    {
        LogMessage("\n        --== Initialization Complete ==--\n");
    }


    /* Tell 'em who wrote it, and what "it" is */
    if(!pv.quiet_flag)
        DisplayBanner();

    if(pv.alert_cmd_override)
    {
        /*
         * if a command line alert override has been specified, setup the
         * appropriate output plugin
         */
        
        /*
         * if we're using syslog alerting set the alert function pointer to
         * the syslog alerting function
         */
        if(pv.syslog_flag)
        {
            /* activate the alert_syslog output plugin*/
            ActivateOutputPlugin("alert_syslog", 
                    "LOG_PID LOG_NDELAY LOG_NOWAIT LOG_AUTH");
        }
#ifdef ENABLE_SMB_ALERTS
        else if(pv.smbmsg_flag)
        {
            /* activate the alert_syslog output plugin*/
            ActivateOutputPlugin("alert_smb", pv.smbmsg_dir);
        }
#endif
        else
        {
            switch(pv.alert_mode)
            {
                case ALERT_FAST:
                    ActivateOutputPlugin("alert_fast", pv.alert_filename);
                    break;

                case ALERT_FULL:
                    ActivateOutputPlugin("alert_full", pv.alert_filename);
                    break;

                case ALERT_NONE:
                    SetOutputList(NoAlert, NT_OUTPUT_ALERT, NULL);
                    break;

                case ALERT_UNSOCK:
                    ActivateOutputPlugin("alert_unixsock", NULL);
                    break;

                case ALERT_STDOUT:
                    ActivateOutputPlugin("alert_fast", "stdout");
                    break;

            }
        }
    }

    /* set the default alert function (alert full) */
    if(AlertList == NULL && pv.use_rules == 1)
    {
        ActivateOutputPlugin("alert_full", pv.alert_filename);
    }

    /* set the alert function pointer list to call all the output plugins */
    AlertFunc = CallAlertPlugins;

    if(pv.log_cmd_override || !pv.log_plugin_active)
    {
        /* logging to a tcpdump file, initialize the output file and pointer */
        if(pv.logbin_flag)
        {
            ActivateOutputPlugin("log_tcpdump", pv.binLogFile);
        }
        else
        {  /* if we're not logging in tcpdump format...
            * set the logging function pointer 
            */ 
            if(!pv.nolog_flag)
            {
                ActivateOutputPlugin("log_ascii", NULL);
            }
            else
            {
                SetOutputList(NoLog, NT_OUTPUT_LOG, NULL);
            }
        }
    }

    if(LogList == NULL && !pv.log_plugin_active)
    {
        ActivateOutputPlugin("log_ascii", NULL);
    }

    LogFunc = CallLogPlugins;


    DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Entering pcap loop\n"););

#ifdef USE_PTHREADS
    /*
     * With pthreads each interface gets a thread of its own.
     * 
     */
    for(i = 0; i < ifr_count; i++)
    {
        pthread_create(&pt[i], NULL, InterfaceThread, NULL);
    }

    while(1)
    {
        sleep(10);
    }

#else
    /* Without pthreads one interface goes in main thread */
    InterfaceThread(NULL);
#endif

    return 0;
}




void ProcessPacket(char *user, struct pcap_pkthdr * pkthdr, u_char * pkt)
{
    Packet p;

    /* reset the packet flags for each packet */
    p.packet_flags = 0;

    pc.total++;

#if defined(WIN32) && defined(ENABLE_WIN32_SERVICE)
    if( pv.terminate_service_flag || pv.pause_service_flag )
    {
        ClearDumpBuf();  /* cleanup and return without processing */
        return;
    }
#endif  /* WIN32 && ENABLE_WIN32_SERVICE */

#ifdef USE_PTHREADS
    pthread_mutex_lock(&pt_lock);
#endif
    /* call the packet decoder */
    (*grinder) (&p, pkthdr, pkt);

    /* print the packet to the screen */
    if(pv.verbose_flag)
    {
        if(p.iph != NULL)
            PrintIPPkt(stdout, p.iph->ip_proto, &p);
        else if(p.ah != NULL)
            PrintArpHeader(stdout, &p);
	else if(p.eplh != NULL)
	{
	    PrintEapolPkt(stdout, &p);
	}
	else if(p.wifih && pv.showwifimgmt_flag)
	{
	     PrintWifiPkt(stdout, &p);
	}
    }
    /* check or log the packet as necessary */
    if(!pv.use_rules && pv.log_flag)
    {
            
        CallLogPlugins(&p, NULL, NULL, NULL);
    }
    else
    {
	/* allow the user to throw away TTLs that won't apply to the
	   detection engine as a whole. */
	if(pv.min_ttl && p.iph != NULL && (p.iph->ip_ttl < pv.min_ttl))
	{
	    DEBUG_WRAP(DebugMessage(DEBUG_DECODE,
				    "MinTTL reached in main detection loop\n"););
	    return;
	} 
	
	/* start calling the detection processes */
        Preprocess(&p);
    }

    ClearDumpBuf();

#ifdef USE_PTHREADS
    pthread_mutex_unlock(&pt_lock);
#endif
}


/*
 * Function: ShowUsage(char *)
 *
 * Purpose:  Display the program options and exit
 *
 * Arguments: progname => name of the program (argv[0])
 *
 * Returns: 0 => success
 */
int ShowUsage(char *progname)
{
    char szUnsupportedOnWin32[5] = "\n";
#ifdef WIN32
    strcpy( szUnsupportedOnWin32, "*\n");
#endif

    fprintf(stderr, "USAGE: %s [-options] <filter options>\n", progname);
#if defined(WIN32) && defined(ENABLE_WIN32_SERVICE)
    fprintf(stderr, "       %s %s %s [-options] <filter options>\n", progname
                                                                   , SERVICE_CMDLINE_PARAM
                                                                   , SERVICE_INSTALL_CMDLINE_PARAM);
    fprintf(stderr, "       %s %s %s\n", progname
                                       , SERVICE_CMDLINE_PARAM
                                       , SERVICE_UNINSTALL_CMDLINE_PARAM);
    fprintf(stderr, "       %s %s %s\n", progname
                                       , SERVICE_CMDLINE_PARAM
                                       , SERVICE_SHOW_CMDLINE_PARAM);
#endif
	fputs("Options:\n", stderr);
    fputs("        -A         Set alert mode: fast, full, console, or none "
                            " (alert file alerts only)", stderr);
    fputs(                    szUnsupportedOnWin32, stderr );
    fputs("                  \"unsock\" enables UNIX socket logging (experimental).\n", stderr);
    fputs("        -a         Display ARP packets\n", stderr);
    fputs("        -b         Log packets in tcpdump format (much faster!)\n", stderr);
    fputs("        -c <rules> Use Rules File <rules>\n", stderr);
    fputs("        -C         Print out payloads with character data only (no hex)\n", stderr);
    fputs("        -d         Dump the Application Layer\n", stderr);
    fputs("        -D         Run Snort in background (daemon) mode\n", stderr);
    fputs("        -e         Display the second layer header info\n", stderr);
#ifdef WIN32
    fputs("        -E         Log alert messages to NT Eventlog. (Win32 only)\n", stderr);
#endif
    fputs("        -f         Turn off fflush() calls after binary log writes\n", stderr);
    fputs("        -F <bpf>   Read BPF filters from file <bpf>\n", stderr);
    fputs("        -g <gname> Run snort gid as <gname> group (or gid) after initialization", stderr);
    fputs(                    szUnsupportedOnWin32, stderr );
    fputs("        -G <mode>  Add reference ids back into alert msgs (modes: basic, url)\n", stderr);
    fputs("        -h <hn>    Home network = <hn>\n", stderr);
    fputs("        -i <if>    Listen on interface <if>\n", stderr);
    fputs("        -I         Add Interface name to alert output\n", stderr);
    fputs("        -l <ld>    Log to directory <ld>\n", stderr);
    fputs("        -m <umask> Set umask = <umask>\n", stderr);
#ifdef ENABLE_SMB_ALERTS
    fputs("        -M <wrkst> Sends SMB message to workstations in file <wrkst>\n", stderr);
    fputs("                   (Requires smbclient to be in PATH)\n", stderr);
#endif
    fputs("        -n <cnt>   Exit after receiving <cnt> packets\n", stderr);
    fputs("        -N         Turn off logging (alerts still work)\n", stderr);
    fputs("        -o         Change the rule testing order to Pass|Alert|Log\n", stderr);
    fputs("        -O         Obfuscate the logged IP addresses\n", stderr);
    fputs("        -p         Disable promiscuous mode sniffing\n", stderr);
    fprintf(stderr, "        -P <snap>  set explicit snaplen of packet (default: %d)\n",
            SNAPLEN);
    fputs("        -q         Quiet. Don't show banner and status report\n", stderr);
    fputs("        -r <tf>    Read and process tcpdump file <tf>\n", stderr);
    fputs("        -R <id>    Include 'id' in snort_intf<id>.pid file name\n", stderr);
#ifdef WIN32
    fputs("        -s <server:port> Log alert messages to syslog server (default port: 514)", stderr);
#else
    fputs("        -s         Log alert messages to syslog\n", stderr);
#endif
    fputs("        -S <n=v>   Set rules file variable n equal to value v\n", stderr);
    fputs("        -t <dir>   Chroots process to <dir> after initialization\n", stderr);
    fputs("        -T         Test and report on the current Snort configuration\n", stderr);
    fputs("        -u <uname> Run snort uid as <uname> user (or uid) after initialization", stderr);
    fputs(                    szUnsupportedOnWin32, stderr );
    fputs("        -U         Use UTC for timestamps\n", stderr);
    fputs("        -v         Be verbose\n", stderr);
    fputs("        -V         Show version number\n", stderr);
#ifdef WIN32
    fputs("        -W         Lists available interfaces. (Win32 only)\n", stderr);
#endif
#ifdef DLT_IEEE802_11
    fputs("        -w         Dump 802.11 management and control frames\n", stderr);
#endif
    fputs("        -X         Dump the raw packet data starting at the link layer\n", stderr);
/* Nobody really uses this, do they?
    fputs( "        -6         Display IPv6 packets\n", stderr);
    fputs( "        -x         Display IPX packets\n", stderr);
*/
    fputs("        -y         Include year in timestamp in the alert and log files\n", stderr);
    fputs("        -z         Set assurance mode, match on established sesions (for TCP)\n", stderr);
    fputs("        -?         Show this information\n", stderr);
    fputs("<Filter Options> are standard BPF options, as seen in TCPDump\n", stderr);

#ifdef WIN32
	fputs("\n* denotes an option that is NOT SUPPORTED in this WIN32 port of snort.", stderr);
#endif

    return 0;
}



/*
 * Function: ParseCmdLine(int, char *)
 *
 * Purpose:  Parse command line args
 *
 * Arguments: argc => count of arguments passed to the routine
 *            argv => 2-D character array, contains list of command line args
 *
 * Returns: 0 => success, 1 => exit on error
 */
extern char *optarg;                /* for getopt */
extern int optind;                /* for getopt */

int ParseCmdLine(int argc, char *argv[])
{
    int ch;                        /* storage var for getopt info */
    int read_bpf = 0;
    char bpf_file[STD_BUF];
    char *eq_n;
    char *tmp;
    char *eq_p;
    char errorbuf[PCAP_ERRBUF_SIZE];
    int umaskchange = 1;
    int defumask = 0;
#ifdef WIN32
	char *devicet;
	int adaplen;
	char **toks;
	int num_toks;
#endif
    char *valid_options;

    DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Parsing command line...\n"););
    /* generally speaking, Snort works best when it's in promiscuous mode */
    pv.promisc_flag = 1;

    /* just to be sane.. */
    username = NULL;
    groupname = NULL;
    chrootdir = NULL;
    pv.pidfile_suffix[0] = 0;

#ifndef WIN32
    valid_options = "R:B:fk:TXL:IOCqS:pNA:m:F:DM:br:xeh:l:dc:n:P:"
        "i:G:vV?ao6u:g:s:t:Uwyz";
#else
    valid_options = "R:B:fk:TXL:IOCqS:pNA:m:F:DM:br:xeh:l:dc:n:P:"
        "i:G:vV?ao6u:g:s:t:UwyzEW";
#endif

    /* loop through each command line var and process it */
    while((ch = getopt(argc, argv, valid_options)) != -1)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Processing cmd line switch: %c\n", ch););
        switch(ch)
        {
            case 'a':                /* show ARP packets */

                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Show ARP is active\n"););
                pv.showarp_flag = 1;

                break;

            case 'A':                /* alert mode */
                if(!strcasecmp(optarg, "none"))
                {
                    pv.alert_mode = ALERT_NONE;
                }
                else if(!strcasecmp(optarg, "full"))
                {
                    pv.alert_mode = ALERT_FULL;
                }
                else if(!strcasecmp(optarg, "fast"))
                {
                    pv.alert_mode = ALERT_FAST;
                }
                else if(!strcasecmp(optarg, "console"))
                {
                    pv.alert_mode = ALERT_STDOUT;
                }
                else if(!strcasecmp(optarg, "unsock"))
                {
                    pv.alert_mode = ALERT_UNSOCK;
                }
                else
                {
                    FatalError("ERROR => Unknown command line alert option: %s\n", optarg);
                }

                /* command line alert machanism has been specified, override 
                 * the config file options 
                 */ 
                pv.alert_cmd_override = 1;

                break;

            case 'b':                /* log packets in binary format for
                                      * post-processing */
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Tcpdump logging mode active\n"););
                pv.logbin_flag = 1;
                pv.log_cmd_override = 1;
                pv.log_flag = 1;

                break;

            case 'B': /* obfuscate with a substitution mask */
                pv.logbin_flag = 1;
                pv.log_cmd_override = 1;
                pv.log_flag = 1;
                pv.obfuscation_flag = 1;

                GenObfuscationMask(optarg);

                break;

            case 'c':                /* use configuration file x */
                strlcpy(pv.config_file, optarg, STD_BUF);
                if (strrchr(optarg,'/'))
                {
                    strlcpy(pv.config_dir, optarg, STD_BUF);
                    tmp = strrchr(pv.config_dir,'/');
                    *(++tmp) = '\0';
                }
                else
                {
                    strlcpy(pv.config_dir, "./", STD_BUF);
                }

                pv.use_rules = 1;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Config file = %s, config dir = %s \n",
					 pv.config_file, pv.config_dir););

                break;

            case 'C':  /* dump the application layer as text only */
                pv.char_data_flag = 1;
                break;

            case 'd':                /* dump the application layer data */
                pv.data_flag = 1;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Data Flag active\n"););
                break;

            case 'D':                /* daemon mode */
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Daemon mode flag set\n"););
                pv.daemon_flag = 1;
                pv.quiet_flag = 1;
                break;

            case 'e':                /* show second level header info */
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Show 2nd level active\n"););
                pv.show2hdr_flag = 1;

                break;

#ifdef WIN32
            case 'E':                /* log alerts to Event Log */
                pv.syslog_flag = 1;
                pv.syslog_remote_flag = 0;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Logging alerts to Event Log\n"););
                pv.alert_cmd_override = 1;
                break;
#endif
            case 'f':
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Pcap linebuffering activated\n"););
                pv.line_buffer_flag = 1;
                break;

            case 'F':                /* read BPF filter in from a file */
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Tcpdump logging mode active\n"););
                strlcpy(bpf_file, optarg, STD_BUF);

                read_bpf = 1;

                break;

            case 'g':                /* setgid handler */
#ifdef WIN32
                FatalError("[!] ERROR: Setting the group id is not supported in the WIN32 port of snort!\n");
#else
                if(groupname != NULL)
                    free(groupname);
                if((groupname = calloc(strlen(optarg) + 1, 1)) == NULL)
                    FatalPrintError("malloc");

                bcopy(optarg, groupname, strlen(optarg));

                if((groupid = atoi(groupname)) == 0)
                {
                    gr = getgrnam(groupname);
                    if(gr == NULL)
                        FatalError("Group \"%s\" unknown\n", groupname);

                    groupid = gr->gr_gid;
                }
#endif
                break;

            case 'G':                /* ghetto backwards compatability msgs */
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Ghetto Messages enabled\n"););
                if(!strcasecmp(optarg, "basic"))
                {
                    pv.ghetto_msg_flag = GHETTO_BASIC;
                }
                else if(!strcasecmp(optarg, "url"))
                {
                    pv.ghetto_msg_flag = GHETTO_URL;
                }
                else
                {
                    FatalError("ERROR => Unknown command line Ghetto option: %s\n", optarg);
                }


                break;

            case 'h':                /* set home network to x, this will help
                                      * determine what to set logging diectories
                                      * to */
                GenHomenet(optarg);

                break;

            case 'i':                /* without PTHREADS we support only single
                                      * listen on interface x interface */
#ifndef WIN32
    #ifndef USE_PTHREADS
                if(ifr_count)
                {
                    ErrorMessage(
                            "\nMultiple interfaces are not supported. %s is used\n"
                            ,pv.interfaces[0]);
                    break;
                }
    #endif  /* USE_PTHREADS */
                if(ifr_count == MAX_INTERFACES)
                {
                    ErrorMessage(
                            "\nMaximum number of interfaces (%i) exceeded."
                            "Please recompile to extend it (oops)\n",
                            MAX_INTERFACES);
                    break;
                }
                pv.interfaces[ifr_count] = (char *) malloc(strlen(optarg) + 1);
                /*bzero((char *) pv.interfaces[ifr_count], strlen(optarg) + 1);*/
                strlcpy(pv.interfaces[ifr_count], optarg, strlen(optarg)+1);
                ifr_count++;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT,
					"Interface = %s\n",
					PRINT_INTERFACE(pv.interfaces[ifr_count - 1])););
#else 
                /* ifdef WIN32 */
                devicet = NULL;
                adaplen = atoi(optarg);
                if( adaplen > 0 )
                {
                    devicet = pcap_lookupdev(errorbuf);
                    if ( devicet == NULL )
                    {
                        perror(errorbuf);
                        exit(-1);
                    }

                    pv.interface = GetAdapterFromList(devicet, adaplen);
                    if ( pv.interface == NULL )
                    {
                        LogMessage("Invalid interface '%d'.", atoi(optarg));
                        exit(-1);
                    }

                    DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Interface = %s\n", PRINT_INTERFACE(pv.interface)));
                }
                else
                {
                    LogMessage("Invalid interface '%d'.", atoi(optarg));
                    exit(-1);
                }
#endif  /* WIN32 */
                break;

            case 'I':       /* add interface name to alert string */
                pv.alert_interface_flag = 1;
                break;

            case 'k':  /* set checksum mode */
                if(!strcasecmp(optarg, "all"))
                {
                    pv.checksums_mode = DO_IP_CHECKSUMS | DO_TCP_CHECKSUMS |
                                        DO_UDP_CHECKSUMS | DO_ICMP_CHECKSUMS;
                }
                else if(!strcasecmp(optarg, "noip")) 
                {
                    pv.checksums_mode ^= DO_IP_CHECKSUMS;
                }
                else if(!strcasecmp(optarg, "notcp"))
                {
                    pv.checksums_mode ^= DO_TCP_CHECKSUMS;
                }
                else if(!strcasecmp(optarg, "noudp"))
                {
                    pv.checksums_mode ^= DO_UDP_CHECKSUMS;
                }
                else if(!strcasecmp(optarg, "noicmp"))
                {
                    pv.checksums_mode ^= DO_ICMP_CHECKSUMS;
                }
                if(!strcasecmp(optarg, "none"))
                {
                    pv.checksums_mode = 0;
                }
                
                break;

            case 'l':                /* use log dir <X> */
                strlcpy(pv.log_dir, optarg, STD_BUF);
                if( access(pv.log_dir, 2) != 0 )
                {
                    FatalError("ERROR: log directory '%s' does not exist\n", pv.log_dir);
                }
                pv.log_flag = 1;
                break;

            case 'L':  /* set BinLogFile name */
                /* implies tcpdump format logging */
                if (strlen(optarg) < 256)
                {
                    pv.binLogFile = strdup(optarg);
                    pv.logbin_flag = 1;
                    pv.log_cmd_override = 1;
                    pv.log_flag = 1;
                }
                else
                {
                    FatalError("ERROR =>ParseCmdLine, log file: %s, > than 256 characters\n",
                            optarg);
                }
                break;


            case 'm': /* set the umask for the output files */
                {
                    char *p;
                    long val = 0;

                    umaskchange = 0;

                    val = strtol(optarg, &p, 8);
                    if (*p != '\0' || val < 0 || (val & ~FILEACCESSBITS))
                    {
                        FatalError("ERROR: bad umask %s\n", optarg);
                    }
                    else
                    {
                        defumask = val;
                    }
                    break;
                }


            case 'M':                /* SMB Message Option */

#ifdef ENABLE_SMB_ALERTS
                pv.smbmsg_flag = 1;
                strlcpy(pv.smbmsg_dir, optarg, STD_BUF);
                pv.alert_cmd_override = 1;
#else
                FatalError("[!] ERROR: SMB support not compiled into program, exiting...\n");
#endif
                break;

            case 'n':                /* grab x packets and exit */
                pv.pkt_cnt = atoi(optarg);
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Exiting after %d packets\n", pv.pkt_cnt););
                break;

            case 'N':                /* no logging mode */
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Logging deactivated\n"););
                pv.nolog_flag = 1;
                pv.log_cmd_override = 1;

                break;

            case 'o': /* change the rules processing order to
                       * passlist first */
                pv.rules_order_flag = 1;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Rule application order changed to Pass->Alert->Log\n"););
                break;

            case 'O':  /* obfuscate the logged IP addresses for
                        * privacy */
                pv.obfuscation_flag = 1;

                break;

            case 'p':  /* disable explicit promiscuous mode */
                pv.promisc_flag = 0;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Promiscuous mode disabled!\n"););
                break;

            case 'P':  /* explicitly define snaplength of packets */
                pv.pkt_snaplen = atoi(optarg);
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Snaplength of Packets set to: %d\n", pv.pkt_snaplen););
                break;

            case 'q':  /* no stdout output mode */
                pv.quiet_flag = 1;
                break;

            case 'r':  /* read packets from a TCPdump file instead
                        * of the net */
                strlcpy(pv.readfile, optarg, STD_BUF);
                pv.readmode_flag = 1;
                if(argc == 3)
                {
                    printf("No run mode specified, defaulting to verbose mode\n");
                    pv.verbose_flag = 1;
                    pv.data_flag = 1;
                }

                break;

            case 'R': /* augment pid file name CPW*/
                if (strlen(optarg) < MAX_PIDFILE_SUFFIX && strlen(optarg) > 0)
                {
                    if (!strstr(optarg, "..") && !(strstr(optarg, "/")))
                    {
                        snprintf(pv.pidfile_suffix, MAX_PIDFILE_SUFFIX, "%s",
                                optarg);
                    }
                    else
                    {
                        FatalError("ERROR: illegal pidfile suffix: %s\n",
                                optarg);
                    }
                }
                else
                {
                    FatalError("ERROR: pidfile suffix length problem: %d\n",
                            strlen(optarg) );
                }

                break;

            case 's':  /* log alerts to syslog */
                pv.syslog_flag = 1;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Logging alerts to syslog\n"););
                /* command line alerting option has been specified, 
                 * override the alert options in the config file
                 */ 
                pv.alert_cmd_override = 1;
#ifdef WIN32
                pv.syslog_remote_flag = 1;
                toks = mSplit(optarg, ":", 2, &num_toks, 0);
                strncpy(pv.syslog_server, toks[0], STD_BUF-1);
                pv.syslog_server_port = (num_toks == 1) ? 514 : atoi(toks[1]);
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Logging alerts to syslog server %s on port %d\n",
					pv.syslog_server, pv.syslog_server_port););
#endif
                break;

            case 'S':  /* set a rules file variable */
                if((eq_p = strchr(optarg, '=')) != NULL)
                {
                    struct VarEntry *p;
                    int namesize = eq_p-optarg;
                    eq_n = calloc(namesize+2, sizeof(char));
                    strlcpy(eq_n, optarg, namesize+1);
                    p = VarDefine(eq_n, eq_p + 1);
                    p->flags |= VAR_STATIC;
                    free(eq_n);
                }
                else
                {
                    FatalError("Format for command line variable definitions "
                               "is:\n -S var=value\n");
                }
                break;

            case 't':  /* chroot to the user specified directory */
#ifdef WIN32
				FatalError("[!] ERROR: Setting the chroot directory is not supported in the WIN32 port of snort!\n");
#else
                if((chrootdir = calloc(strlen(optarg) + 2, 1)) == NULL)
                    FatalPrintError("malloc");

                /* make sure '/' is appended */
                sprintf(chrootdir, "%s/", optarg);
#endif  /* WIN32 */
                break;

            case 'T': /* test mode, verify that the rules load properly */
                pv.test_mode_flag = 1;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Snort starting in test mode...\n"););
                break;    

            case 'u':  /* setuid */
#ifdef WIN32
                FatalError("[!] ERROR: Setting the user id is not "
                        "supported in the WIN32 port of snort!\n");
#else
                if((username = calloc(strlen(optarg) + 1, 1)) == NULL)
                    FatalPrintError("malloc");

                bcopy(optarg, username, strlen(optarg));

                if((userid = atoi(username)) == 0)
                {
                    pw = getpwnam(username);
                    if(pw == NULL)
                        FatalError("User \"%s\" unknown\n", username);

                    userid = pw->pw_uid;
                }
                else
                {
                    pw = getpwuid(userid);
                    if(pw == NULL)
                        FatalError(
                                "Can not obtain username for uid: %lu\n",
                                (u_long) userid);
                }

                if(groupname == NULL)
                {
                    char name[256];

                    snprintf(name, 255, "%lu", (u_long) pw->pw_gid);

                    if((groupname = calloc(strlen(name) + 1, 1)) == NULL)
                    {
                        FatalPrintError("malloc");
                    }
                    groupid = pw->pw_gid;
                }
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "UserID: %lu GroupID: %lu\n",
					(unsigned long) userid, (unsigned long) groupid););
#endif  /* WIN32 */
                break;

            case 'U': /* use UTC */
                pv.use_utc = 1;
                break;

            case 'v': /* be verbose */
                pv.verbose_flag = 1;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Verbose Flag active\n"););
                break;

            case 'V': /* prog ver already gets printed out, so we
                       * just exit */
                DisplayBanner();
                exit(0);

#ifdef WIN32
            case 'W':
                if ((pv.interface = pcap_lookupdev(errorbuf)) == NULL)
                    perror(errorbuf);

                DisplayBanner();
                PrintDeviceList(pv.interface);
                exit(0);
                break;
#endif  /* WIN32 */
#ifdef DLT_IEEE802_11
            case 'w':                /* show 802.11 all frames info */
	        pv.showwifimgmt_flag = 1;

                break;
#endif

            case 'x':  /* display IPX packets (decoder not
                        * implemented yet) */
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Show IPX active\n"););
                pv.showipx_flag = 1;

                break;

            case 'X':  /* display verbose packet bytecode dumps */
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Verbose packet bytecode dumps enabled\n"););
                pv.verbose_bytedump_flag = 1;
                break;

            case 'y':  /* Add year to timestamp in alert and log files */
                pv.include_year = 1;
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Enabled year in timestamp\n"););
                break;

            case 'z': /* set assurance mode (used with stream 4) */
                    pv.assurance_mode = ASSURE_EST;
                break;

            case '?':  /* show help and exit */
                DisplayBanner();
                ShowUsage(progname);
                exit(0);

            case '6':  /* display IPv6 packets (decoder not implemented yet) */
                DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Show IPv6 active\n"););
                pv.showipv6_flag = 1;

                break;

        }
    }


    /* if the umask arg happened, set umask */
    if (umaskchange)
    {
        umask(077);           /* set default to be sane */
    }
    else
    {
        umask(defumask);
    }

    /* if we're reading in BPF filters from a file */
    if(read_bpf)
    {
        /* suck 'em in */
        pv.pcap_cmd = read_infile(bpf_file);
    }
    else
    {
        /* set the BPF rules string (thanks Mike!) */
        pv.pcap_cmd = copy_argv(&argv[optind]);
    }

    if((pv.interfaces[0] == NULL) && !pv.readmode_flag)
    {
        pv.interfaces[0] = pcap_lookupdev(errorbuf);

        if(pv.interfaces[0] == NULL)
            FatalError( "Failed to lookup for interface: %s."
                    " Please specify one with -i switch\n", errorbuf);
    }

    DEBUG_WRAP(DebugMessage(DEBUG_INIT, "pcap_cmd is %s\n", 
			    pv.pcap_cmd !=NULL ? pv.pcap_cmd : "NULL"););

    return 0;
}



/*
 * Function: SetPktProcessors()
 *
 * Purpose: initializes PktProcessors per-interface
 */
void SetPktProcessors()
{
    int i;

    for(i = 0; i < ifr_count; i++)
    {
        SetPktProcessor(i);
    }

}

/*
 * Function: SetPktProcessor()
 *
 * Purpose:  Set which packet processing function we're going to use based on
 *           what type of datalink layer we're using
 *
 * Arguments: int num => number of interface
 *
 * Returns: 0 => success
 */
int SetPktProcessor(int num)
{
    switch(datalinks[num])
    {
        case DLT_EN10MB:        /* Ethernet */
            if(!pv.readmode_flag)
            {
                if(!pv.quiet_flag)
                    LogMessage("Decoding Ethernet on interface %s\n", 
                           PRINT_INTERFACE(pv.interfaces[num]));
            }

            grinders[num] = DecodeEthPkt;
            break;

#ifdef DLT_IEEE802_11
    case DLT_IEEE802_11:
      if (!pv.readmode_flag)
      {
	if (!pv.quiet_flag)
	  LogMessage("Decoding IEEE 802.11 on interface %s\n",
		     PRINT_INTERFACE(pv.interfaces[num]));
      }
      
      grinders[num] = DecodeIEEE80211Pkt;
      break;
#endif
        case 13:
        case DLT_IEEE802:                /* Token Ring */
            if(!pv.readmode_flag)
            {
                if(!pv.quiet_flag)
                    LogMessage("Decoding Token Ring on interface %s\n", 
                           PRINT_INTERFACE(pv.interfaces[num]));
            }

            grinders[num] = DecodeTRPkt;

            break;

        case DLT_FDDI:                /* FDDI */
            if(!pv.readmode_flag)
            {
                if(!pv.quiet_flag)
                    LogMessage("Decoding FDDI on interface %s\n", 
                            PRINT_INTERFACE(pv.interfaces[num]));
            }

            grinders[num] = DecodeFDDIPkt;

            break;


        case DLT_SLIP:                /* Serial Line Internet Protocol */
            if(!pv.readmode_flag)
            {
                if(!pv.quiet_flag)
                    LogMessage("Decoding Slip on interface %s\n", 
                           PRINT_INTERFACE(pv.interfaces[num]));
            }

            if(pv.show2hdr_flag == 1)
            {
                LogMessage("Second layer header parsing for this datalink "
                       "isn't implemented yet\n");

                pv.show2hdr_flag = 0;
            }

            grinders[num] = DecodeSlipPkt;

            break;

        case DLT_PPP:                /* point-to-point protocol */
            if(!pv.readmode_flag)
            {
                if(!pv.quiet_flag)
                    LogMessage("Decoding PPP on interface %s\n", 
                           PRINT_INTERFACE(pv.interfaces[num]));
            }

            if(pv.show2hdr_flag == 1)
            {
                /* do we need ppp header showup? it's only 4 bytes anyway ;-) */
                LogMessage("Second layer header parsing for this datalink "
                       "isn't implemented yet\n");
                pv.show2hdr_flag = 0;
            }

            grinders[num] = DecodePppPkt;

            break;
#ifdef DLT_LINUX_SLL
        case DLT_LINUX_SLL:
             if(!pv.readmode_flag)
            {
                if(!pv.quiet_flag)
                    LogMessage("Decoding 'ANY' on interface %s\n", 
                            PRINT_INTERFACE(pv.interfaces[num]));
            }

            grinders[num] = DecodeLinuxSLLPkt;

            break;
#endif

#ifdef DLT_PFLOG
        case DLT_PFLOG:
            if(!pv.readmode_flag)
            {
                if(!pv.quiet_flag)
                    LogMessage("Decoding OpenBSD PF log on interface %s\n",
                        PRINT_INTERFACE(pv.interfaces[num]));
            }

            grinders[num] = DecodePflog;

            break;
#endif

#ifdef DLT_LOOP
        case DLT_LOOP:
#endif
        case DLT_NULL:            /* loopback and stuff.. you wouldn't perform
                             * intrusion detection on it, but it's ok for
                             * testing. */
            if(!pv.readmode_flag)
            {
                if(!pv.quiet_flag)
                {
                    LogMessage("Decoding LoopBack on interface %s\n", 
                            PRINT_INTERFACE(pv.interfaces[num]));
                }
            }

            if(pv.show2hdr_flag == 1)
            {
                LogMessage("Data link layer header parsing for this network "
                        " type isn't implemented yet\n");
                pv.show2hdr_flag = 0;
            }
            grinders[num] = DecodeNullPkt;

            break;

#ifdef DLT_RAW /* Not supported in some arch or older pcap
                * versions */
        case DLT_RAW:
            if(!pv.readmode_flag)
            {
                if(!pv.quiet_flag)
                    LogMessage("Decoding raw data on interface %s\n", 
                           PRINT_INTERFACE(pv.interfaces[num]));
            }

            if(pv.show2hdr_flag == 1)
            {
                LogMessage("There's no second layer header available for "
                        "this datalink\n");
                pv.show2hdr_flag = 0;
            }
            grinders[num] = DecodeRawPkt;

            break;
#endif
            /*
             * you need the I4L modified version of libpcap to get this stuff
             * working
             */
#ifdef DLT_I4L_RAWIP
        case DLT_I4L_RAWIP:
            if (! pv.readmode_flag && !pv.quiet_flag)
                LogMessage("Decoding I4L-rawip on interface %s\n", 
                        PRINT_INTERFACE(pv.interfaces[num]));

            grinders[num] = DecodeI4LRawIPPkt;

            break;
#endif

#ifdef DLT_I4L_IP
        case DLT_I4L_IP:
            if (! pv.readmode_flag && !pv.quiet_flag)
                LogMessage("Decoding I4L-ip on interface %s\n", 
                        PRINT_INTERFACE(pv.interfaces[num]));

            grinders[num] = DecodeEthPkt;

            break;
#endif

#ifdef DLT_I4L_CISCOHDLC
        case DLT_I4L_CISCOHDLC:
            if (! pv.readmode_flag && !pv.quiet_flag)
                LogMessage("Decoding I4L-cisco-h on interface %s\n", 
                   PRINT_INTERFACE(pv.interfaces[num]));

            grinders[num] = DecodeI4LCiscoIPPkt;

            break;
#endif

        default:                        /* oops, don't know how to handle this one */
            ErrorMessage("\n%s cannot handle data link type %d\n",
                         progname, datalink);
            CleanExit(SIGQUIT);
    }

    return 0;
}

/*
 * Function: InitializeInterfaces(void)
 *
 * Purpose - initialize all specified in command line interface(s)
 */
void InitializeInterfaces(void)
{
    int i;

    for(i = 0; i < ifr_count; i++)        /* going through all interfaces */
    {
        OpenPcap(pv.interfaces[i], i);
    }
}



/*
 * Function: void *InterfaceThread(void *arg)
 *
 * Purpose: wrapper for pthread_create() to create a thread per interface
 */
void *InterfaceThread(void *arg)
{
    static int intnum = 0;
    int myint;
    struct timeval starttime;
    struct timeval endtime;
    struct timeval difftime;
    struct timezone tz;

#ifdef USE_PTHREADS
    pthread_mutex_lock(&pt_lock);        /* just to make sure we don't skip
                                         * any interfaces, and no threads
                                         * would start on the same interface
                                         * simultaneously */
#endif

    myint = intnum;
    intnum++;

#ifdef USE_PTHREADS
    pthread_mutex_unlock(&pt_lock);
#endif

    if(pv.test_mode_flag)
    {
        LogMessage("\nSnort sucessfully loaded all rules and checked all rule chains!\n");
        CleanExit(SIGQUIT);
    }

    if(pv.daemon_flag)
    {
        LogMessage("Snort initialization completed successfully, Snort running");
    }
    bzero((char *) &tz, sizeof(tz));
    gettimeofday(&starttime, &tz);

    /* Read all packets on the device.  Continue until cnt packets read */
    if(pcap_loop(pds[myint], pv.pkt_cnt, (pcap_handler) ProcessPacket, NULL) < 0)
    {
        if(pv.daemon_flag)
            syslog(LOG_CONS | LOG_DAEMON, "pcap_loop: %s", pcap_geterr(pd));
        else
            ErrorMessage("pcap_loop: %s\n", pcap_geterr(pd));

        CleanExit(SIGQUIT);
    }

    gettimeofday(&endtime, &tz);

    difftime.tv_sec = endtime.tv_sec - starttime.tv_sec;
    if(starttime.tv_usec > endtime.tv_usec)
    {
        difftime.tv_usec = starttime.tv_usec - endtime.tv_usec;
    }
    else
    {
        difftime.tv_usec = endtime.tv_usec - starttime.tv_usec;
    }

    printf("Run time for packet processing was %lu.%lu seconds\n", 
            difftime.tv_sec, difftime.tv_usec);

    CleanExit(SIGQUIT);

    return NULL;                /* avoid warnings */
}



/****************************************************************************
 *
 * Function: OpenPcap(char *, int)
 *
 * Purpose:  Open the libpcap interface
 *
 * Arguments: intf => name of the interface to open
 *            num  => number of the interface (to fill-in datalink and pd)
 *
 * Returns: 0 => success, exits on problems
 *
 ****************************************************************************/
int OpenPcap(char *intf, int num)
{
    bpf_u_int32 localnet, netmask;        /* net addr holders */
    struct bpf_program fcode;        /* Finite state machine holder */
    char errorbuf[PCAP_ERRBUF_SIZE];        /* buffer to put error strings in */
    bpf_u_int32 defaultnet = 0xFFFFFF00;

    /* if we're not reading packets from a file */
    if(pv.interfaces[num] == NULL)
    {
        if (!pv.readmode_flag)
        {
            DEBUG_WRAP(DebugMessage(DEBUG_INIT,
				    "pv.interface is NULL, looking up interface....   "););
            /* look up the device and get the handle */
            pv.interfaces[num] = pcap_lookupdev(errorbuf);
    
            DEBUG_WRAP(DebugMessage(DEBUG_INIT,
				    "found interface %s\n", pv.interfaces[num]););
            /* uh oh, we couldn't find the interface name */
            if(pv.interfaces[num] == NULL)
            {
                FatalError("ERROR: OpenPcap() interface lookup: \n\t%s\n",
			   errorbuf);
            }
        }
        else
        {
            /* interface is null and we are in readmode */
	    /* some routines would hate it to be NULL */
	    pv.interfaces[num] = "[reading from a file]"; 
        }
    }

    if(!pv.quiet_flag)
    {
        if (!pv.readmode_flag)
            LogMessage("\nInitializing Network Interface %s\n", 
                    pv.interfaces[num]);
        else 
            LogMessage("TCPDUMP file reading mode.\n");
    }

    if (!pv.readmode_flag)
    {
        if(pv.pkt_snaplen)        /* if it's set let's try it... */
        {
            if(pv.pkt_snaplen < MIN_SNAPLEN)        /* if it's < MIN set it to
                                                     * MIN */
            {
                /* XXX: Warning message, specidifed snaplen too small,
                 * snaplen set to X
                 */
                 snaplen = MIN_SNAPLEN;
            }
            else
            {
                 snaplen = pv.pkt_snaplen;
            }
         }
         else
         {
             snaplen = SNAPLEN;        /* otherwise let's put the compiled value in */
         }
        
        DEBUG_WRAP(DebugMessage(DEBUG_INIT,
				"snaplength info: set=%d/compiled=%d/wanted=%d\n",
				snaplen,  SNAPLEN, pv.pkt_snaplen););
    
        /* get the device file descriptor */
        pds[num] = pcap_open_live(pv.interfaces[num], snaplen,
                pv.promisc_flag ? PROMISC : 0, READ_TIMEOUT, errorbuf);

        /* lookup mtu */
        pv.mtus[num] = GetIfrMTU(pv.interfaces[num]);
            
        if (pv.mtus[num] == -1)
        {
            FatalError("ERROR: Can not get MTU of an interface %s!\n", 
                    pv.interfaces[num]);
        }
 
        
    }
    else
    {   /* reading packets from a file */

        if (!pv.quiet_flag)
        {
    	    LogMessage("Reading network traffic from \"%s\" file.\n", 
                    pv.readfile);
        }
        /* open the file */
        pds[num] = pcap_open_offline(pv.readfile, errorbuf);

        /* the file didn't open correctly */
        if(pds[num] == NULL)
        {
            FatalError("ERROR => unable to open file \"%s\" for readback: %s\n",
                       pv.readfile, errorbuf);
        }
        /*
         * set the snaplen for the file (so we don't get a lot of extra crap
         * in the end of packets
         */
        snaplen = pcap_snapshot(pds[num]);

        /* captured framesize can not be bigger than snaplen */
        pv.mtus[num] = snaplen;

        if(!pv.quiet_flag)
            LogMessage("snaplen = %d\n", snaplen);
    }

    /* something is wrong with the opened packet socket */
    if(pds[num] == NULL)
    {
        if(strstr(errorbuf, "Permission denied"))
        {
           FatalError("ERROR: Um... Dude.  You don't have permission to"
                      " sniff.\nTry doing this as root.\n");
        }
        else
        {

           FatalError("ERROR: OpenPcap() device %s open: \n\t%s\n",
                       PRINT_INTERFACE(pv.interfaces[num]), errorbuf);
        }
    }
    /* get local net and netmask */
    if(pcap_lookupnet(pv.interfaces[num], &localnet, &netmask, errorbuf) < 0)
    {
       if (!pv.readmode_flag)
       {
            ErrorMessage("WARNING: OpenPcap() device %s network lookup: \n"
                    "\t%s\n", PRINT_INTERFACE(pv.interfaces[num]), errorbuf);
       }
        /*
         * set the default netmask to 255.255.255.0 (for stealthed
         * interfaces)
         */
        netmask = htonl(defaultnet);
    }
    else
    {
        DefineIfaceVar(pv.interfaces[num], (u_char *) &localnet, 
                (u_char *) &netmask);
    }

    /* compile BPF filter spec info fcode FSM */
    if(pcap_compile(pds[num], &fcode, pv.pcap_cmd, 1, netmask) < 0)
    {
        ErrorMessage("ERROR: OpenPcap() FSM compilation failed: \n\t%s\n",
                     pcap_geterr(pds[num]));
        FatalError("PCAP command: %s\n", pv.pcap_cmd);
    }
    /* set the pcap filter */
    if(pcap_setfilter(pds[num], &fcode) < 0)
    {
        FatalError("ERROR: OpenPcap() setfilter: \n\t%s\n",
                   pcap_geterr(pds[num]));
    }
    /* get data link type */
    datalinks[num] = pcap_datalink(pds[num]);

    if(datalinks[num] < 0)
    {
        FatalError("ERROR: OpenPcap() datalink grab: \n\t%s\n",
                   pcap_geterr(pds[num]));
    }
    return 0;
}


/****************************************************************************
 *
 * Function  : GetIfrMTU()
 * Purpose   : Get Interface MTU value
 * Arguments : interface name (string)
 * Returns   : MTU (or -1)
 *
 ****************************************************************************/

#ifdef BROKEN_SIOCGIFMTU

/* this routine will be used to obtain MTU of an interface on those platforms
 * where SIOCGIFMTU ioctl is not available.
 * The idea is following:
 *     we obtain interface flags, if interface has IP broadcast address defined, 
 *     we get this address as an address of 'remote' point, otherwise we assume
 *     that inteface is p-t-p link to some other end and we obtain IP address of
 *     the 'remote' point. Then we resolve route to that IP address using route(4)
 *     socket and read MTU from the response. In any case of non-critical failure
 *     default (ETHERNET_MTU) is returned. In case of error: -1 is returned.
 *     NOTE: we have no ideas how get MTU if no IP on interface is configured,
 *     any hints would be appreciated (fygrave@tigerteam.net)
 *
 *     Thanks to Angelos D. Keromytis for guidelines.
 *
 */
int GetIfrMTU(char *name) {

  int retval;
  int fd, rd, n;
  struct ifreq ifr;
  struct sockaddr_in remote, *sin;
  struct rt_msghdr *rtm;

    retval = ETHERNET_MTU; /* to make ourselves fail-proof, we will return default ETHERNET_MTU in case
                            * of noncritical failure */

    if(name == NULL || *name == NULL)
    {
        return retval;
    }

    fd = socket(AF_INET, SOCK_DGRAM, 0);
    if ( fd < 0) {
        PrintError("socket");
        return -1; /* something serious got screwed up */
    }

    strncpy(ifr.ifr_name, name, sizeof(ifr.ifr_name));


/*  get IP address of other end of P-t-P link or broadcast
   address in the subnet */

    if (ioctl(fd, SIOCGIFFLAGS, &ifr) < 0) {
        PrintError("ioctl(SIOCGIFFLAGS)");
        /* failed to obtain interface flags.. no go */
        close(fd);
        return -1; /* interface doesn't exist or your kernel is flacky */
    }
   
    if (ifr.ifr_flags & IFF_POINTOPOINT) {
         /* if p-t-p we will use IP address of remote end... */
        if (ioctl(fd, SIOCGIFDSTADDR, &ifr) < 0) {
          close(fd);
          return retval;
        }
        bcopy((void *)&ifr.ifr_dstaddr,(void *)&remote, sizeof(remote));
    } else {
         
        /* otherwise we just get broadcast */
        if (ioctl(fd, SIOCGIFBRDADDR, &ifr) < 0) {
            /* no broadcast and no p-t-p? */
            close(fd);
            return retval; /* consider it 'doable'.. :) */
        }
        bcopy((void *)&ifr.ifr_broadaddr,(void *)&remote, sizeof(remote));
    } /* if p-t-p */

    if (remote.sin_family != AF_INET) {
      /* if not AF_INET, then we'll very likely fail bellow.. */
      LogMessage("WARNING: obtained address is not AF_INET family. Using default MTU\n");      
      close(fd);
      return retval;
    }


    DEBUG_WRAP(DebugMessage(DEBUG_INIT, "GetIfrMTU: remote address is: %s\n",
			    inet_ntoa(remote.sin_addr)););

    if ((rd = socket(PF_ROUTE, SOCK_RAW, AF_INET)) < 0) {
        /* failed to create route socket (permissions?), just return default */
        close(fd);
        return retval;
    }

    DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Routing socket created\n"););
    
    /* now issue RTM_GET for IP address (RTM_RESOLVE doesn't work?) */
    /* a'la UNP/R.Stevens */
    rtm = (struct rt_msghdr *) calloc(1, (sizeof(struct rt_msghdr) + 512));
    
    if (rtm == NULL) {
        PrintError("calloc");
        close(fd);
        close(rd);
        return -1; /* if we couldn't calloc, something bad is about to happen.. */
    }
    
    
    rtm->rtm_msglen = sizeof(struct rt_msghdr) + sizeof(struct sockaddr_in);
    rtm->rtm_version = RTM_VERSION;
    rtm->rtm_type = RTM_GET;
    rtm->rtm_addrs = RTA_DST;
    rtm->rtm_pid = getpid();
    rtm->rtm_seq = 1234; /* random */

    sin = (struct sockaddr_in *)(rtm + 1);
    bcopy((void *)&remote, (void *) sin, sizeof(sin));
    sin->sin_len = sizeof(struct sockaddr_in);

    if (write(rd, rtm, rtm->rtm_msglen) != rtm->rtm_msglen) {
        /* something is wrong . .. */
        PrintError("write(route_sock)");
        free(rtm);
        close(fd);
        close(rd);
        return retval;
    }


    do {
        n = read(rd, rtm, sizeof(struct rt_msghdr) + 512);
        if (n < 0) {
            PrintError("read(route_sock)");
            free(rtm);
            close(fd);
            close(rd);
            return retval;
        }
    } while (rtm->rtm_type !=RTM_GET || rtm->rtm_seq != 1234
             || rtm->rtm_pid != getpid());


    retval =  rtm->rtm_rmx.rmx_mtu; 
        
        
    free(rtm);
    close(fd);
    close(rd);
    return retval;
}



#else /* !BROKEN_SIOCGIFMTU */

/* this is a real-world implementation :)
 */

int GetIfrMTU(char *name)
{
    
#ifdef WIN32
    /* Winpcap only supports Ethernet Interfaces currently.
       Ethernet has 1MTU of 1500.*/
    return ETHERNET_MTU;
#else

    int fd;
    struct ifreq ifr;
    int retval;

    retval = ETHERNET_MTU; /* default */

    if(name == NULL || *name == 0)
    {
        return ETHERNET_MTU;
    }

#ifdef LINUX
    /*
     * on linux platform with interface type 'any'
     * there's no way to automagically pick up mtu,
     * so we fall back to ETHERNET_MTU size....
     *
     * later it should be replaced to a more sophisticated
     * routine: lookup for all interfaces, lookup for all
     * MTUs, pick up the biggest... :)
     */
    if (!strcmp("any",name)) {
        return ETHERNET_MTU;
    }
#endif    

    fd = socket(AF_INET, SOCK_DGRAM, 0);
    if ( fd < 0) {
        PrintError("socket");
        return -1;
    }

    strlcpy(ifr.ifr_name, name, sizeof(ifr.ifr_name));

#ifndef OSF1
#ifdef SIOCGIFMTU
    if (ioctl(fd, SIOCGIFMTU, &ifr) == 0)
        retval = ifr.ifr_metric;
    else
#endif
#else
    if (ioctl(fd, SIOCRIPMTU, &ifr) == 0)
        retval = ifr.ifr_metric;
    else
#endif
    {
        PrintError("ioctl(SIOC*MTU)");
        LogMessage("Automagic MTU discovery failed. Using default %i", retval);
    }

    close(fd);
    
    return retval;
#endif
}


#endif /* !BROKEN_SICGIFMTU */


/****************************************************************************
 *
 * Function: CleanExit()
 *
 * Purpose:  Clean up misc file handles and such and exit
 *
 * Arguments: Signal
 *
 * Returns: void function
 *
 ****************************************************************************/
extern PluginSignalFuncNode *PluginCleanExitList;
extern PluginSignalFuncNode *PluginRestartList;

void CleanExit(int sig)
{
    PluginSignalFuncNode *idx;

    if(sig == SIGHUP)
        LogMessage("\nRestarting...\n");

    unlink(pv.pid_filename);

    pv.pid_filename[0] = 0;

    if(pv.alert_mode == ALERT_FAST || pv.alert_mode == ALERT_FULL)
    {
        if(alert != NULL)
        {
            fclose(alert);
        }
    }
    /* carry signals down to plugins */
    if(sig != SIGHUP)
    {
        idx = PluginCleanExitList;
    }
    else
    {
        idx = PluginRestartList;
    }

    while(idx != NULL)
    {
        idx->func(sig, idx->arg);
        idx = idx->next;
    }

    if(!pv.test_mode_flag)
    {
        DropStats(0);
    }

    if(pd == NULL)
    {
        LogMessage("Snort exiting...");
        exit(1);
    }

    CleanupProtoNames();

#ifdef WIN32
    WSACleanup();
#endif
    pcap_close(pds[0]);

    exit_or_exec(0, sig);
    exit(0);
}


/*
 *
 * exit_or_exec()
 * Arguments: status, signal received.
 *
 * This function performs exec on SIGHUP signal and exit otherwise
 *
 */
void exit_or_exec(int stat, int sig)
{
    /* make sure everything that needs to go to the screen gets there */
    fflush(stdout);

    if(sig != SIGHUP)
    {
        if(!pv.test_mode_flag)
        {
            LogMessage("Snort received signal %d, exiting\n", sig);
        }

        exit(stat);
    }
    else
    {
        LogMessage("Received SIGHUP. Restarting");
#ifdef PARANOID
        execv(progname, progargs);
#else
        execvp(progname, progargs);
#endif
        LogMessage("Restarting %s failed", progname);
        exit(1);
    }
}


void ReadConfFile()
{
    struct stat st;
    int found;
    int i;
    char *conf_files[]={"/etc/snort.conf", "./snort.conf", NULL};
    char *fname = NULL;
    char *home_dir;
    char *tmp;

    found = 0;
    i = 0;

    /* find the conf file */
    while(!found && conf_files[i] != NULL)
    {
        fname = conf_files[i];

        if(stat(fname, &st) != -1)
        {
            LogMessage("using config file %s\n", fname);
            found = 1;
        }
        else
        {
            i++;
        }
    }

    if(!found)
    {
        home_dir = getenv("HOME");

        if(home_dir != NULL)
        {
            if(stat(home_dir, &st) != -1)
            {
                if(!S_ISDIR(st.st_mode) || access(home_dir, R_OK) == -1)
                {
                    return;
                }

                fname = strcat(home_dir, "/.snortrc");
                LogMessage("using config file %s\n", fname);
                found = 1;
            }
        }
    }

    strlcpy(pv.config_file, fname, STD_BUF);

    if (strrchr(fname,'/'))
    {
        strlcpy(pv.config_dir, fname, STD_BUF);
        tmp = strrchr(pv.config_dir,'/');
        *(++tmp) = '\0';
    }
    else
    {
        strlcpy(pv.config_dir, "./", STD_BUF);
    }

    pv.use_rules = 1;
    DEBUG_WRAP(DebugMessage(DEBUG_INIT, "Config file = %s, config dir = %s \n",
			    pv.config_file, pv.config_dir););

    /* initialize all the plugin modules */
    InitPreprocessors();
    InitPlugIns();
    /* InitOutputPlugins(); */
    InitTag();

#ifdef DEBUG
    DumpPreprocessors();
    DumpPlugIns();
    DumpOutputPlugins();
#endif

    /* setup the default rule action anchor points */
    CreateDefaultRules();

    if(pv.rules_order_flag)
    {
        OrderRuleLists("pass activation dynamic alert log");
    }

    if(!pv.quiet_flag)
        LogMessage("Parsing Rules file %s\n", pv.config_file);

    ParseRulesFile(pv.config_file, 0);

    if(!pv.quiet_flag)
    {
        printRuleOrder();
    }

    conf_done = 1;
}

/* vim: smartindent:expandtab:sw=4:ts=4:tw=0
 */
