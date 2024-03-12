/* 
  Purpose: Enumerate all the various detection plugins entries for
           otn->ds_list[]

  No more grepping to make your own plugin!
*/

/* $Id: plugin_enum.h,v 1.2 2002/05/15 15:11:11 andrewbaker Exp $ */

enum {
    PLUGIN_CLIENTSERVER,
    PLUGIN_DSIZE_CHECK,
    PLUGIN_FRAG_BITS,
    PLUGIN_FRAG_OFFSET,
    PLUGIN_ICMP_CODE,
    PLUGIN_ICMP_ID_CHECK,
    PLUGIN_ICMP_SEQ_CHECK,
    PLUGIN_ICMP_TYPE,
    PLUGIN_IPOPTION_CHECK,
    PLUGIN_IP_ID_CHECK,
    PLUGIN_IP_PROTO_CHECK,
    PLUGIN_IP_SAME_CHECK,
    PLUGIN_IP_TOS_CHECK,
    PLUGIN_PATTERN_MATCH, /* AND match */
    PLUGIN_PATTERN_MATCH_OR, 
    PLUGIN_PATTERN_MATCH_URI,
    PLUGIN_RESPOND,
    PLUGIN_RPC_CHECK,
    PLUGIN_SESSION,
    PLUGIN_TCP_ACK_CHECK,
    PLUGIN_TCP_FLAG_CHECK,
    PLUGIN_TCP_SEQ_CHECK,
    PLUGIN_TCP_WIN_CHECK,
    PLUGIN_TTL_CHECK,
};
