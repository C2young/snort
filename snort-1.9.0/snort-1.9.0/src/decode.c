/* $Id: decode.c,v 1.80 2002/08/13 04:37:13 chrisgreen Exp $ */

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

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <string.h>
#include <stdlib.h>

#include "decode.h"
#include "snort.h"
#include "debug.h"
#include "util.h"
#include "detect.h"
#include "checksum.h"
#include "log.h"
#include "generators.h"

/* No great place to put this right now */
HttpUri UriBufs[URI_COUNT];
u_int8_t DecodeBuffer[DECODE_BLEN];


/*
 * Function: DecodeEthPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decode those fun loving ethernet packets, one at a time!
 *
 * Arguments: p => pointer to the decoded packet struct
 *            user => Utility pointer (unused)
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodeEthPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    u_int32_t pkt_len;      /* suprisingly, the length of the packet */
    u_int32_t cap_len;      /* caplen value */

    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    /* set the lengths we need */
    pkt_len = pkthdr->len;  /* total packet length */
    cap_len = pkthdr->caplen;   /* captured packet length */

    if(snaplen < pkt_len)
        pkt_len = cap_len;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n");
            DebugMessage(DEBUG_DECODE, "caplen: %lu    pktlen: %lu\n", 
                (unsigned long)cap_len, (unsigned long)pkt_len);
            );

    /* do a little validation */
    if(p->pkth->caplen < ETHERNET_HEADER_LEN)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("Captured data length < Ethernet header length!"
                    " (%d bytes)\n", p->pkth->caplen);
        }
        return;
    }

    /* lay the ethernet structure over the packet data */
    p->eh = (EtherHdr *) pkt;

    DEBUG_WRAP(
            DebugMessage(DEBUG_DECODE, "%X   %X\n", 
                *p->eh->ether_src, *p->eh->ether_dst);
            );

    /* grab out the network type */
    switch(ntohs(p->eh->ether_type))
    {
        case ETHERNET_TYPE_PPPoE_DISC:
        case ETHERNET_TYPE_PPPoE_SESS:
            DecodePPPoEPkt(p, pkthdr, pkt);
            return;

        case ETHERNET_TYPE_IP:
            DEBUG_WRAP(
                    DebugMessage(DEBUG_DECODE, 
                        "IP datagram size calculated to be %lu bytes\n",
                        (unsigned long)(cap_len - ETHERNET_HEADER_LEN));
                    );

            DecodeIP(p->pkt + ETHERNET_HEADER_LEN, 
                    cap_len - ETHERNET_HEADER_LEN, p);

            return;

        case ETHERNET_TYPE_ARP:
        case ETHERNET_TYPE_REVARP:
            pc.arp++;
            DecodeARP(p->pkt + ETHERNET_HEADER_LEN, 
                    cap_len - ETHERNET_HEADER_LEN, p);
            return;

        case ETHERNET_TYPE_IPV6:
            pc.ipv6++;
            if(pv.showipv6_flag)
                DecodeIPV6(p->pkt + ETHERNET_HEADER_LEN, 
                        (cap_len - ETHERNET_HEADER_LEN));
            return;

        case ETHERNET_TYPE_IPX:
            pc.ipx++;
            if(pv.showipx_flag)
                DecodeIPX(p->pkt + ETHERNET_HEADER_LEN, 
                        (cap_len - ETHERNET_HEADER_LEN));
            return;

        case ETHERNET_TYPE_8021Q:
            DecodeVlan(p->pkt + ETHERNET_HEADER_LEN, 
                    cap_len - ETHERNET_HEADER_LEN, p);
            return; 

        default:
            pc.other++;
            return;
    }

    return;
}


/*
 * Function: DecodeIEEE80211Pkt(Packet *, char *, struct pcap_pkthdr*, 
 *                               u_int8_t*)
 *
 * Purpose: Decode those fun loving wireless LAN packets, one at a time!
 *
 * Arguments: p => pointer to the decoded packet struct
 *            user => Utility pointer (unused)
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodeIEEE80211Pkt(Packet * p, struct pcap_pkthdr * pkthdr, 
			u_int8_t * pkt)
{
    u_int32_t pkt_len;      /* suprisingly, the length of the packet */
    u_int32_t cap_len;      /* caplen value */

    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    /* set the lengths we need */
    pkt_len = pkthdr->len;  /* total packet length */
    cap_len = pkthdr->caplen;   /* captured packet length */

    if(snaplen < pkt_len)
        pkt_len = cap_len;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n"););
    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "caplen: %lu    pktlen: %lu\n", 
                (unsigned long)cap_len, (unsigned long)pkt_len););

    /* do a little validation */
    if(p->pkth->caplen < MINIMAL_IEEE80211_HEADER_LEN)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("Captured data length < IEEE 802.11 header length! (%d bytes)\n", p->pkth->caplen);
        }
        return;
    }
    /* lay the wireless structure over the packet data */
    p->wifih = (WifiHdr *) pkt;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "%X   %X\n", *p->wifih->addr1, 
                *p->wifih->addr2););

    /* determine frame type */
    switch(p->wifih->frame_control & 0x00ff)
    {
        /* management frames */
        case WLAN_TYPE_MGMT_ASREQ:
        case WLAN_TYPE_MGMT_ASRES:
        case WLAN_TYPE_MGMT_REREQ:
        case WLAN_TYPE_MGMT_RERES:
        case WLAN_TYPE_MGMT_PRREQ:
        case WLAN_TYPE_MGMT_PRRES:
        case WLAN_TYPE_MGMT_BEACON:
        case WLAN_TYPE_MGMT_ATIM:
        case WLAN_TYPE_MGMT_DIS:
        case WLAN_TYPE_MGMT_AUTH:
        case WLAN_TYPE_MGMT_DEAUTH:
            pc.wifi_mgmt++;
            //      pc.other++;
            break;

            /* Control frames */
        case WLAN_TYPE_CONT_PS:
        case WLAN_TYPE_CONT_RTS:
        case WLAN_TYPE_CONT_CTS:
        case WLAN_TYPE_CONT_ACK:
        case WLAN_TYPE_CONT_CFE:
        case WLAN_TYPE_CONT_CFACK:
            pc.wifi_control++;
            //      pc.other++;
            break;
            /* Data packets without data */
        case WLAN_TYPE_DATA_NULL:
        case WLAN_TYPE_DATA_CFACK:
        case WLAN_TYPE_DATA_CFPL:
        case WLAN_TYPE_DATA_ACKPL:

            pc.wifi_data++;
            //      pc.other++;
            break;
            /* data packets with data */
        case WLAN_TYPE_DATA_DTCFACK:
        case WLAN_TYPE_DATA_DTCFPL:
        case WLAN_TYPE_DATA_DTACKPL:
        case WLAN_TYPE_DATA_DATA:
            pc.wifi_data++;
            p->ehllc = (EthLlc *) (pkt + IEEE802_11_DATA_HDR_LEN);

#ifdef DEBUG
            PrintNetData(stdout,(u_int8_t *)  p->ehllc, sizeof(EthLlc));
            ClearDumpBuf();

            printf("LLC Header:\n");
            printf("   DSAP: 0x%X\n", p->ehllc->dsap);
            printf("   SSAP: 0x%X\n", p->ehllc->ssap);
#endif

            if(p->ehllc->dsap == ETH_DSAP_IP &&
                    p->ehllc->ssap == ETH_SSAP_IP)
            {      
                p->ehllcother = (EthLlcOther *) (pkt + IEEE802_11_DATA_HDR_LEN + sizeof(EthLlc));
#ifdef DEBUG
                PrintNetData(stdout,(u_int8_t *) p->ehllcother, sizeof(EthLlcOther));
                ClearDumpBuf();
                printf("LLC Other Header:\n");
                printf("   CTRL: 0x%X\n", p->ehllcother->ctrl);
                printf("   ORG: 0x%02X%02X%02X\n", p->ehllcother->org_code[0], 
                        p->ehllcother->org_code[1], p->ehllcother->org_code[2]);
                printf("   PROTO: 0x%04X\n", ntohs(p->ehllcother->proto_id));
#endif

                switch(ntohs(p->ehllcother->proto_id))
                {
                    case ETHERNET_TYPE_IP:
                        DecodeIP(p->pkt + IEEE802_11_DATA_HDR_LEN + sizeof(EthLlc) +
                                sizeof(EthLlcOther), 
                                pkt_len - IEEE802_11_DATA_HDR_LEN - sizeof(EthLlc) - 
                                sizeof(EthLlcOther), p);
                        return;

                    case ETHERNET_TYPE_ARP:
                    case ETHERNET_TYPE_REVARP:
                        pc.arp++;
                        DecodeARP(p->pkt + IEEE802_11_DATA_HDR_LEN + sizeof(EthLlc) +
                                sizeof(EthLlcOther), 
                                pkt_len - IEEE802_11_DATA_HDR_LEN - sizeof(EthLlc) -
                                sizeof(EthLlcOther), p);
                        return;
                    case ETHERNET_TYPE_EAPOL:
                        pc.eapol++;
                        DecodeEapol(p->pkt + IEEE802_11_DATA_HDR_LEN + sizeof(EthLlc) +
                                sizeof(EthLlcOther),
                                pkt_len - IEEE802_11_DATA_HDR_LEN - sizeof(EthLlc) -
                                sizeof(EthLlcOther), p);
                        return;
                    case ETHERNET_TYPE_8021Q:
                        DecodeVlan(p->pkt + IEEE802_11_DATA_HDR_LEN , 
                                cap_len - IEEE802_11_DATA_HDR_LEN , p);
                        return; 

                    default:
                        pc.other++;
                        return;
                }
            }
            break;
        default:
            pc.other++;
            break;
    }

    return;
}


void DecodeVlan(u_int8_t * pkt, const u_int32_t len, Packet * p)
{
    u_int16_t pri;
    p->vh = (VlanTagHdr *) pkt;

    pri = VTH_PRIORITY(p->vh);

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Vlan traffic:\n");
            DebugMessage(DEBUG_DECODE, "   Priority: %d(0x%X)\n", pri, pri);
            DebugMessage(DEBUG_DECODE, "   CFI: %d\n", VTH_CFI(p->vh));
            DebugMessage(DEBUG_DECODE, "   Vlan ID: %d(0x%04X)\n", 
                VTH_VLAN(p->vh), VTH_VLAN(p->vh));
            DebugMessage(DEBUG_DECODE, "   Vlan Proto: 0x%04X\n", 
                ntohs(p->vh->vth_proto));
            );

    /* check to see if we've got an encapsulated LLC layer */
    if(pri != 0)
    {
        p->ehllc = (EthLlc *) (pkt + sizeof(VlanTagHdr));

        DEBUG_WRAP(
                DebugMessage(DEBUG_DECODE, "LLC Header:\n");
                DebugMessage(DEBUG_DECODE, "   DSAP: 0x%X\n", p->ehllc->dsap);
                DebugMessage(DEBUG_DECODE, "   SSAP: 0x%X\n", p->ehllc->ssap);
                );

        if(p->ehllc->dsap == ETH_DSAP_IP &&
                p->ehllc->ssap == ETH_SSAP_IP)
        {      
            p->ehllcother = (EthLlcOther *) 
                (pkt + sizeof(VlanTagHdr) + sizeof(EthLlc));

            DEBUG_WRAP(
                    DebugMessage(DEBUG_DECODE, "LLC Other Header:\n");
                    DebugMessage(DEBUG_DECODE, "   CTRL: 0x%X\n", 
                        p->ehllcother->ctrl);
                    DebugMessage(DEBUG_DECODE, "   ORG: 0x%02X%02X%02X\n", 
                        p->ehllcother->org_code[0], p->ehllcother->org_code[1], 
                        p->ehllcother->org_code[2]);
                    DebugMessage(DEBUG_DECODE, "   PROTO: 0x%04X\n", 
                        ntohs(p->ehllcother->proto_id));
                    );

            switch(ntohs(p->ehllcother->proto_id))
            {
                case ETHERNET_TYPE_IP:
                    DecodeIP(p->pkt + sizeof(VlanTagHdr) + sizeof(EthLlc) +
                            sizeof(EthLlcOther), len - sizeof(VlanTagHdr), p);
                    return;

                case ETHERNET_TYPE_ARP:
                case ETHERNET_TYPE_REVARP:
                    pc.arp++;
                    DecodeARP(p->pkt + sizeof(VlanTagHdr)+ sizeof(EthLlc) +
                            sizeof(EthLlcOther), len - sizeof(VlanTagHdr), p);
                    return;

                default:
                    pc.other++;
                    return;
            }
        }
    }
    else
    {
        switch(ntohs(p->vh->vth_proto))
        {
            case ETHERNET_TYPE_IP:
                DecodeIP(pkt + sizeof(VlanTagHdr), 
                        len - sizeof(VlanTagHdr), p);
                return;

            case ETHERNET_TYPE_ARP:
            case ETHERNET_TYPE_REVARP:
                pc.arp++;
                DecodeARP(pkt + sizeof(VlanTagHdr), 
                        len - sizeof(VlanTagHdr), p);
                return;

            default:
                pc.other++;
                return;
        }
    }
}

/*
 * Function: DecodeNullPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decoding on loopback devices.
 *
 * Arguments: p => pointer to decoded packet struct
 *            user => Utility pointer, unused
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodeNullPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    u_int32_t len;
    u_int32_t cap_len;

    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    len = pkthdr->len;
    cap_len = pkthdr->caplen;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n"); );

    /* do a little validation */
    if(cap_len < NULL_HDRLEN)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("NULL header length < captured len! (%d bytes)\n",
                    cap_len);
        }

        return;
    }

    DecodeIP(p->pkt + NULL_HDRLEN, cap_len - NULL_HDRLEN, p);
}

/*
 * Function: DecodeTRPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decode Token Ring packets!
 *
 * Arguments: p=> pointer to decoded packet struct
 *            user => Utility pointer, unused
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodeTRPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    u_int32_t pkt_len;      /* suprisingly, the length of the packet */
    u_int32_t cap_len;      /* caplen value */
    u_int32_t dataoff;      /* data offset is variable here */


    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;


    /* set the lengths we need */
    pkt_len = pkthdr->len;  /* total packet length */
    cap_len = pkthdr->caplen;   /* captured packet length */

    if(snaplen < pkt_len)
        pkt_len = cap_len;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n");
            DebugMessage(DEBUG_DECODE, "caplen: %lu    pktlen: %lu\n",
                (unsigned long)cap_len,(unsigned long) pkt_len);
            );

    /* do a little validation */
    if(p->pkth->caplen < TR_HLEN)
    {
        if(pv.verbose_flag)
            ErrorMessage("Captured data length < Token Ring header length! "
                    "(%d < %d bytes)\n", p->pkth->caplen, TR_HLEN);
        return;
    }

    /* lay the tokenring header structure over the packet data */
    p->trh = (Trh_hdr *) pkt;

    /*
     * according to rfc 1042:
     The presence of a Routing Information Field is indicated by the Most
     Significant Bit (MSB) of the source address, called the Routing
     Information Indicator (RII).  If the RII equals zero, a RIF is
     not present.  If the RII equals 1, the RIF is present.
     ..
     However the MSB is already zeroed by this moment, so there's no
     real way to figure out whether RIF is presented in packet, so we are
     doing some tricks to find IPARP signature..
     */

    /*
     * first I assume that we have single-ring network with no RIF
     * information presented in frame
     */
    p->trhllc = (Trh_llc *) (pkt + sizeof(Trh_hdr));

    if(p->trhllc->dsap != IPARP_SAP && p->trhllc->ssap != IPARP_SAP)
    {
        /*
         * DSAP != SSAP != 0xAA .. either we are having frame which doesn't
         * carry IP datagrams or has RIF information present. We assume
         * lattest ...
         */
        p->trhmr = (Trh_mr *) (pkt + sizeof(Trh_hdr));
        p->trhllc = (Trh_llc *) (pkt + sizeof(Trh_hdr) + TRH_MR_LEN(p->trhmr));
        dataoff = sizeof(Trh_hdr) + TRH_MR_LEN(p->trhmr) + sizeof(Trh_llc);
    }
    else
    {
        p->trhllc = (Trh_llc *) (pkt + sizeof(Trh_hdr));
        dataoff = sizeof(Trh_hdr) + sizeof(Trh_llc);
    }

    /*
     * ideally we would need to check both SSAP, DSAP, and protoid fields: IP
     * datagrams and ARP requests and replies are transmitted in standard
     * 802.2 LLC Type 1 Unnumbered Information format, control code 3, with
     * the DSAP and the SSAP fields of the 802.2 header set to 170, the
     * assigned global SAP value for SNAP [6].  The 24-bit Organization Code
     * in the SNAP is zero, and the remaining 16 bits are the EtherType from
     * Assigned Numbers [7] (IP = 2048, ARP = 2054). .. but we would check
     * SSAP and DSAP and assume this would be enough to trust.
     */
    if(p->trhllc->dsap != IPARP_SAP && p->trhllc->ssap != IPARP_SAP)
    {
        DEBUG_WRAP(
                DebugMessage(DEBUG_DECODE, "DSAP and SSAP arent set to SNAP\n");
                );
        p->trhllc = NULL;
        return;
    }
    pkt_len -= dataoff;
    cap_len -= dataoff;

    switch(htons(p->trhllc->ethertype))
    {
        case ETHERNET_TYPE_IP:
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Decoding IP\n"););
            DecodeIP(p->pkt + dataoff, cap_len, p);
            return;

        case ETHERNET_TYPE_ARP:
        case ETHERNET_TYPE_REVARP:
            DEBUG_WRAP(
                    DebugMessage(DEBUG_DECODE, "Decoding ARP\n");
                    );
            pc.arp++;

            return;

        case ETHERNET_TYPE_8021Q:
            DecodeVlan(p->pkt + dataoff, 
                    cap_len, p);
            return; 


        default:
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Unknown network protocol: %d\n", 
                        htons(p->trhllc->ethertype)));
            pc.other++;
            return;
    }

    return;
}


/*
 * Function: DecodeFDDIPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Mainly taken from CyberPsycotic's Token Ring Code -worm5er
 *
 * Arguments: p => pointer to decoded packet struct
 *            user => Utility pointer, unused
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodeFDDIPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    u_int32_t pkt_len;      /* length of the packet */
    u_int32_t cap_len;      /* capture length variable */
    u_int32_t dataoff;      /* data offset is variable here */

    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    pkt_len = pkthdr->len;
    cap_len = pkthdr->caplen;

    if(snaplen < pkt_len)
    {
        pkt_len = cap_len;
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE,"Packet!\n");
            DebugMessage(DEBUG_DECODE, "caplen: %lu    pktlen: %lu\n",
                (unsigned long) cap_len,(unsigned long) pkt_len);
            );

    /* Bounds checking (might not be right yet -worm5er) */
    if(p->pkth->caplen < FDDI_MIN_HLEN)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("Captured data length < FDDI header length! "
                    "(%d %d bytes)\n", p->pkth->caplen, FDDI_MIN_HLEN);
            return;
        }
    }
    /* let's put this in as the fddi header structure */
    p->fddihdr = (Fddi_hdr *) pkt;

    p->fddisaps = (Fddi_llc_saps *) (pkt + sizeof(Fddi_hdr));

    /* First we'll check and see if it's an IP/ARP Packet... */
    /* Then we check to see if it's a SNA packet */
    /*
     * Lastly we'll declare it none of the above and just slap something
     * generic on it to discard it with (I know that sucks, but heck we're
     * only looking for IP/ARP type packets currently...  -worm5er
     */
    if((p->fddisaps->dsap == FDDI_DSAP_IP) && (p->fddisaps->ssap == FDDI_SSAP_IP))
    {
        p->fddiiparp = (Fddi_llc_iparp *) (pkt + sizeof(Fddi_hdr) +
                sizeof(Fddi_llc_saps));

        dataoff = sizeof(Fddi_hdr) + sizeof(Fddi_llc_saps) +
            sizeof(Fddi_llc_iparp);
    }
    else if((p->fddisaps->dsap == FDDI_DSAP_SNA) &&
            (p->fddisaps->ssap == FDDI_SSAP_SNA))
    {
        p->fddisna = (Fddi_llc_sna *) (pkt + sizeof(Fddi_hdr) +
                sizeof(Fddi_llc_saps));
        dataoff = sizeof(Fddi_hdr) + sizeof(Fddi_llc_saps) +
            sizeof(Fddi_llc_sna);
    }
    else
    {
        p->fddiother = (Fddi_llc_other *) (pkt + sizeof(Fddi_hdr) +
                sizeof(Fddi_llc_other));

        dataoff = sizeof(Fddi_hdr) + sizeof(Fddi_llc_saps) +
            sizeof(Fddi_llc_other);
    }

    /*
     * Now let's see if we actually care about the packet... If we don't,
     * throw it out!!!
     */
    if((p->fddisaps->dsap != FDDI_DSAP_IP) && 
            (p->fddisaps->ssap != FDDI_SSAP_IP))
    {
        DEBUG_WRAP(
                DebugMessage(DEBUG_DECODE, 
                    "This FDDI Packet isn't an IP/ARP packet...\n");
                );
        return;
    }

    pkt_len -= dataoff;
    cap_len -= dataoff;

    switch(htons(p->fddiiparp->ethertype))
    {
        case ETHERNET_TYPE_IP:
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Decoding IP\n"););
            DecodeIP(p->pkt + dataoff, cap_len, p);
            return;

        case ETHERNET_TYPE_ARP:
        case ETHERNET_TYPE_REVARP:
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Decoding ARP\n"););
            pc.arp++;

            return;

        case ETHERNET_TYPE_8021Q:
            DecodeVlan(p->pkt + dataoff, cap_len, p);
            return; 


        default:
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Unknown network protocol: %d\n",
                        htons(p->fddiiparp->ethertype));
                    );
            pc.other++;

            return;
    }

    return;
}

/*
 * Function: DecodeLinuxSLLPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decode those fun loving LinuxSLL (linux cooked sockets) 
 *          packets, one at a time!
 *
 * Arguments: p => pointer to the decoded packet struct
 *            user => Utility pointer (unused)
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
 
#ifdef DLT_LINUX_SLL 

void DecodeLinuxSLLPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    u_int32_t pkt_len;      /* the length of the packet */
    u_int32_t cap_len;      /* caplen value */

    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    /* set the lengths we need */
    pkt_len = pkthdr->len;  /* total packet length */
    cap_len = pkthdr->caplen;   /* captured packet length */

    if(snaplen < pkt_len)
        pkt_len = cap_len;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE,"Packet!\n");
            DebugMessage(DEBUG_DECODE, "caplen: %lu    pktlen: %lu\n",
                (unsigned long)cap_len, (unsigned long)pkt_len););

    /* do a little validation */
    if(p->pkth->caplen < SLL_HDR_LEN)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("Captured data length < SLL header length (your "
                    "libpcap is broken?)! (%d bytes)\n", p->pkth->caplen);
        }
        return;
    }
    /* lay the ethernet structure over the packet data */
    p->sllh = (SLLHdr *) pkt;

    /* grab out the network type */
    switch(ntohs(p->sllh->sll_protocol))
    {
        case ETHERNET_TYPE_IP:
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE,
                        "IP datagram size calculated to be %lu bytes\n",
                        (unsigned long)(cap_len - SLL_HDR_LEN)););

            DecodeIP(p->pkt + SLL_HDR_LEN, cap_len - SLL_HDR_LEN, p);
            return;

        case ETHERNET_TYPE_ARP:
        case ETHERNET_TYPE_REVARP:
            pc.arp++;
            if(pv.showarp_flag)
            {
                DecodeARP(p->pkt + SLL_HDR_LEN, cap_len - SLL_HDR_LEN, p);
            }
            return;

        case ETHERNET_TYPE_IPV6:
            pc.ipv6++;
            if(pv.showipv6_flag)
                DecodeIPV6(p->pkt + SLL_HDR_LEN, (cap_len - SLL_HDR_LEN));
            return;

        case ETHERNET_TYPE_IPX:
            pc.ipx++;
            if(pv.showipx_flag)
                DecodeIPX(p->pkt + SLL_HDR_LEN, (cap_len - SLL_HDR_LEN));
            return;

        case LINUX_SLL_P_802_3:
            DEBUG_WRAP(DebugMessage(DEBUG_DATALINK,
                        "Linux SLL P 802.3 is not supported.\n"););
            pc.other++;
            return;

        case LINUX_SLL_P_802_2:
            DEBUG_WRAP(DebugMessage(DEBUG_DATALINK,
                        "Linux SLL P 802.2 is not supported.\n"););
            pc.other++;
            return;

        case ETHERNET_TYPE_8021Q:
            DecodeVlan(p->pkt + SLL_HDR_LEN, cap_len - SLL_HDR_LEN, p);
            return; 

        default:
            /* shouldn't go here unless pcap library changes again */
            /* should be a DECODE generated alert */
            DEBUG_WRAP(DebugMessage(DEBUG_DATALINK,"(Unknown) %X is not supported. "
                        "(need tcpdump snapshots to test. Please contact us)\n",
                        p->sllh->sll_protocol););
            pc.other++;
            return;
    }

    return;
}

#endif /* DLT_LINUX_SLL */

/*
 * Function: DecodePflog(Packet *, struct pcap_pkthdr *, u_int8_t *)
 *
 * Purpose: Pass pflog device packets off to IP or IP6 -fleck
 *
 * Arguments: p => pointer to the decoded packet struct
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the packet data
 *
 * Returns: void function
 *
 */
void DecodePflog(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    u_int32_t pkt_len;      /* suprisingly, the length of the packet */
    u_int32_t cap_len;      /* caplen value */

    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    /* set the lengths we need */
    pkt_len = pkthdr->len;  /* total packet length */
    cap_len = pkthdr->caplen;   /* captured packet length */

    if(snaplen < pkt_len)
        pkt_len = cap_len;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n");
            DebugMessage(DEBUG_DECODE, "caplen: %lu    pktlen: %lu\n", 
                (unsigned long)cap_len, (unsigned long)pkt_len););

    /* do a little validation */
    if(p->pkth->caplen < PFLOG_HDRLEN)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("Captured data length < Pflog header length! "
                    "(%d bytes)\n", p->pkth->caplen);
        }
        return;
    }

    /* lay the pf header structure over the packet data */
    p->pfh = (PflogHdr *) pkt;

    /*  get the network type - should only be AF_INET or AF_INET6 */
    switch(ntohl(p->pfh->af))
    {
        case AF_INET:   /* IPv4 */
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "IP datagram size calculated to be %lu "
                        "bytes\n", (unsigned long)(cap_len - PFLOG_HDRLEN)););

            DecodeIP(p->pkt + PFLOG_HDRLEN, cap_len - PFLOG_HDRLEN, p);
            return;

#ifdef AF_INET6
        case AF_INET6:  /* IPv6 */
            pc.ipv6++;
            if(pv.showipv6_flag)
                DecodeIPV6(p->pkt + PFLOG_HDRLEN, (cap_len - PFLOG_HDRLEN));
            return;
#endif

        default:
            /* To my knowledge, pflog devices can only 
             * pass IP and IP6 packets. -fleck 
             */
            pc.other++;
            return;
    }

    return;
}


/*
 * Function: DecodePPPoEPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decode those fun loving ethernet packets, one at a time!
 *
 * Arguments: p => pointer to the decoded packet struct
 *            user => Utility pointer (unused)
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 *
 * see http://www.faqs.org/rfcs/rfc2516.html
 *
 */
void DecodePPPoEPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    u_int32_t pkt_len;      /* suprisingly, the length of the packet */
    u_int32_t cap_len;      /* caplen value */
    PPPoEHdr *ppppoep=0;
    PPPoE_Tag *ppppoe_tag=0;
    PPPoE_Tag tag; /* needed to avoid alignment problems */

#ifdef DEBUG
    char *buf;
    int i;
#endif

    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    /* set the lengths we need */
    pkt_len = pkthdr->len;  /* total packet length */
    cap_len = pkthdr->caplen;   /* captured packet length */

    if(snaplen < pkt_len)
        pkt_len = cap_len;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n");
            DebugMessage(DEBUG_DECODE, "caplen: %lu    pktlen: %lu\n", 
                (unsigned long)cap_len, (unsigned long)pkt_len););

    /* do a little validation */
    if(p->pkth->caplen < ETHERNET_HEADER_LEN)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("Captured data length < Ethernet header length! "
                    "(%d bytes)\n", p->pkth->caplen);
        }

        return;
    }

    /* XXX - MFR
     * This code breaks the decode model that Snort uses, we should 
     * reimplement it properly ASAP
     */

    /* lay the ethernet structure over the packet data */
    p->eh = (EtherHdr *) pkt;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "%X   %X\n", 
                *p->eh->ether_src, *p->eh->ether_dst););

    ppppoep = (PPPoEHdr *)pkt;

    /* grab out the network type */
    switch(ntohs(p->eh->ether_type))
    {
        case ETHERNET_TYPE_PPPoE_DISC:
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "(PPPOE Discovery) "););
            break;

        case ETHERNET_TYPE_PPPoE_SESS:
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "(PPPOE Session) "););
            break;

        default:
            return;
    }

#ifdef DEBUG
    switch(ppppoep->code)
    {
        case PPPoE_CODE_PADI:
            /* The Host sends the PADI packet with the DESTINATION_ADDR set 
             * to the broadcast address.  The CODE field is set to 0x09 and
             * the SESSION_ID MUST be set to 0x0000.
             *
             * The PADI packet MUST contain exactly one TAG of TAG_TYPE 
             * Service-Name, indicating the service the Host is requesting, 
             * and any number of other TAG types.  An entire PADI packet 
             * (including the PPPoE header) MUST NOT exceed 1484 octets so 
             * as to leave sufficient room for a relay agent to add a 
             * Relay-Session-Id TAG.
             */ 
            DebugMessage(DEBUG_DECODE, "Active Discovery Initiation (PADI)\n");
            break;

        case PPPoE_CODE_PADO:
            /* When the Access Concentrator receives a PADI that it can 
             * serve, it replies by sending a PADO packet.  The 
             * DESTINATION_ADDR is the unicast address of the Host that 
             * sent the PADI.  The CODE field is set to 0x07 and the 
             * SESSION_ID MUST be set to 0x0000.  
             * 
             * The PADO packet MUST contain one AC-Name TAG containing the 
             * Access Concentrator's name, a Service-Name TAG identical to 
             * the one in the PADI, and any number of other Service-Name 
             * TAGs indicating other services that the Access Concentrator 
             * offers.  If the Access Concentrator can not serve the PADI 
             * it MUST NOT respond with a PADO.
             */ 
            DebugMessage(DEBUG_DECODE, "Active Discovery Offer (PADO)\n");
            break;

        case PPPoE_CODE_PADR:
            /* Since the PADI was broadcast, the Host may receive more than 
             * one PADO.  The Host looks through the PADO packets it receives 
             * and chooses one.  The choice can be based on the AC-Name or 
             * the Services offered.  The Host then sends one PADR packet 
             * to the Access Concentrator that it has chosen.  The 
             * DESTINATION_ADDR field is set to the unicast Ethernet address 
             * of the Access Concentrator that sent the PADO.  The CODE 
             * field is set to 0x19 and the SESSION_ID MUST be set to 0x0000.
             *
             * The PADR packet MUST contain exactly one TAG of TAG_TYPE 
             * Service-Name, indicating the service the Host is requesting, 
             * and any number of other TAG types.
             */ 
            DebugMessage(DEBUG_DECODE, "Active Discovery Request (PADR)\n");
            break;

        case PPPoE_CODE_PADS:
            /* When the Access Concentrator receives a PADR packet, it 
             * prepares to begin a PPP session.  It generates a unique 
             * SESSION_ID for the PPPoE session and replies to the Host with 
             * a PADS packet.  The DESTINATION_ADDR field is the unicast 
             * Ethernet address of the Host that sent the PADR.  The CODE 
             * field is set to 0x65 and the SESSION_ID MUST be set to the 
             * unique value generated for this PPPoE session.
             *
             * The PADS packet contains exactly one TAG of TAG_TYPE 
             * Service-Name, indicating the service under which Access 
             * Concentrator has accepted the PPPoE session, and any number 
             * of other TAG types.
             *
             * If the Access Concentrator does not like the Service-Name in 
             * the PADR, then it MUST reply with a PADS containing a TAG of 
             * TAG_TYPE Service-Name-Error (and any number of other TAG 
             * types).  In this case the SESSION_ID MUST be set to 0x0000.
             */ 
            DebugMessage(DEBUG_DECODE, "Active Discovery "
                    "Session-confirmation (PADS)\n");
            break;

        case PPPoE_CODE_PADT:
            /* This packet may be sent anytime after a session is established 
             * to indicate that a PPPoE session has been terminated.  It may 
             * be sent by either the Host or the Access Concentrator.  The 
             * DESTINATION_ADDR field is a unicast Ethernet address, the 
             * CODE field is set to 0xa7 and the SESSION_ID MUST be set to 
             * indicate which session is to be terminated.  No TAGs are 
             * required.  
             *
             * When a PADT is received, no further PPP traffic is allowed to 
             * be sent using that session.  Even normal PPP termination 
             * packets MUST NOT be sent after sending or receiving a PADT.  
             * A PPP peer SHOULD use the PPP protocol itself to bring down a 
             * PPPoE session, but the PADT MAY be used when PPP can not be 
             * used.
             */ 
            DebugMessage(DEBUG_DECODE, "Active Discovery Terminate (PADT)\n");
            break;

        case PPPoE_CODE_SESS: 
            DebugMessage(DEBUG_DECODE, "Session Packet (SESS)\n");
            break;

        default:
            DebugMessage(DEBUG_DECODE, "(Unknown)\n");
            break;
    }
#endif

    if (ntohs(p->eh->ether_type) != ETHERNET_TYPE_PPPoE_DISC)
    {
        DecodePppPkt(p, pkthdr, pkt+18);
        return;
    }

    ppppoe_tag = (PPPoE_Tag *)(pkt + sizeof(PPPoEHdr));

    while (ppppoe_tag < (PPPoE_Tag *)(pkt + pkthdr->caplen))
    {
        /* no guarantee in PPPoE spec that ppppoe_tag is aligned at all... */
        memcpy(&tag, ppppoe_tag, sizeof(tag));

        DEBUG_WRAP(
                DebugMessage(DEBUG_DECODE, "\tPPPoE tag:\ntype: %04x length: %04x ", 
                    ntohs(tag.type), ntohs(tag.length)););

#ifdef DEBUG
        switch(ntohs(tag.type))
        {
            case PPPoE_TAG_END_OF_LIST:
                DebugMessage(DEBUG_DECODE, "(End of list)\n\t");
                break;
            case PPPoE_TAG_SERVICE_NAME:
                DebugMessage(DEBUG_DECODE, "(Service name)\n\t");
                break;
            case PPPoE_TAG_AC_NAME:
                DebugMessage(DEBUG_DECODE, "(AC Name)\n\t");
                break;
            case PPPoE_TAG_HOST_UNIQ:
                DebugMessage(DEBUG_DECODE, "(Host Uniq)\n\t");
                break;
            case PPPoE_TAG_AC_COOKIE:
                DebugMessage(DEBUG_DECODE, "(AC Cookie)\n\t");
                break;
            case PPPoE_TAG_VENDOR_SPECIFIC:
                DebugMessage(DEBUG_DECODE, "(Vendor Specific)\n\t");
                break;
            case PPPoE_TAG_RELAY_SESSION_ID:
                DebugMessage(DEBUG_DECODE, "(Relay Session ID)\n\t");
                break;
            case PPPoE_TAG_SERVICE_NAME_ERROR:
                DebugMessage(DEBUG_DECODE, "(Service Name Error)\n\t");
                break;
            case PPPoE_TAG_AC_SYSTEM_ERROR:
                DebugMessage(DEBUG_DECODE, "(AC System Error)\n\t");
                break;
            case PPPoE_TAG_GENERIC_ERROR:
                DebugMessage(DEBUG_DECODE, "(Generic Error)\n\t");
                break;
            default:
                DebugMessage(DEBUG_DECODE, "(Unknown)\n\t");
                break;
        }
#endif

        if (ntohs(tag.length) > 0)
        {
#ifdef DEBUG
            switch (ntohs(tag.type))
            {
                case PPPoE_TAG_SERVICE_NAME:
                case PPPoE_TAG_AC_NAME:
                case PPPoE_TAG_SERVICE_NAME_ERROR:
                case PPPoE_TAG_AC_SYSTEM_ERROR:
                case PPPoE_TAG_GENERIC_ERROR: /* ascii data */
                    buf = (char *) calloc(ntohs(tag.length) + 1, sizeof(char));
                    strlcpy(buf, (char *)(ppppoe_tag+1), ntohs(tag.length));
                    DebugMessage(DEBUG_DECODE, "data (UTF-8): %s\n", buf);
                    free(buf);
                    break;

                case PPPoE_TAG_HOST_UNIQ:
                case PPPoE_TAG_AC_COOKIE:
                case PPPoE_TAG_RELAY_SESSION_ID:
                    DebugMessage(DEBUG_DECODE, "data (bin): ");
                    for (i = 0; i < ntohs(tag.length); i++)
                        DebugMessage(DEBUG_DECODE,
                                "%02x", *(((unsigned char *)ppppoe_tag) + 
                                    sizeof(PPPoE_Tag) + i));
                    DebugMessage(DEBUG_DECODE, "\n");
                    break;

                default:
                    DebugMessage(DEBUG_DECODE, "unrecognized data\n");
                    break;
            }
#endif
        }

        ppppoe_tag = (PPPoE_Tag *)((char *)(ppppoe_tag+1)+ntohs(tag.length));
    }

    return;
}


/*
 * Function: DecodePppPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decoded PPP traffic
 *
 * Arguments: p => pointer to decoded packet struct 
 *            user => Utility pointer, unused
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodePppPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    static int had_vj = 0;
    u_int32_t len;
    u_int32_t cap_len;
    struct ppp_header *ppphdr;

    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;
    ppphdr = (struct ppp_header *)pkt; 

    len = pkthdr->len;
    cap_len = pkthdr->caplen;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n"););

    /* do a little validation */
    if(cap_len < PPP_HDRLEN)
    {
        ErrorMessage("PPP header length < captured len! (%d bytes)\n",
                cap_len);
        return;
    }

    /* 
     * We only handle uncompressed packets. Handling VJ compression would mean
     * to implement a PPP state machine.
     */
    switch (ntohs(ppphdr->protocol)) 
    {
        case PPP_VJ_COMP:
            if (!had_vj)
                ErrorMessage("PPP link seems to use VJ compression, "
                        "cannot handle compressed packets!\n");
            had_vj = 1;
            break;
        case PPP_VJ_UCOMP:
            /* VJ compression modifies the protocol field. It must be set
             * to tcp (only TCP packets can be VJ compressed) */
            if(cap_len < PPP_HDRLEN + IP_HEADER_LEN)
            {
                ErrorMessage("PPP VJ min packet length > captured len! "
                        "(%d bytes)\n", cap_len);
                return;
            }

            ((IPHdr *)(p->pkt + PPP_HDRLEN))->ip_proto = IPPROTO_TCP;
            /* fall through */

        case PPP_IP:
            DecodeIP(p->pkt + PPP_HDRLEN, cap_len - PPP_HDRLEN, p);
            break;

        case PPP_IPX:
            DecodeIPX(p->pkt + PPP_HDRLEN, cap_len - PPP_HDRLEN);
            break;
    }
}


/*
 * Function: DecodeSlipPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decode SLIP traffic
 *
 * Arguments: p => pointer to decoded packet struct 
 *            user => Utility pointer, unused
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodeSlipPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    u_int32_t len;
    u_int32_t cap_len;

    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    len = pkthdr->len;
    cap_len = pkthdr->caplen;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n"););

    /* do a little validation */
    if(cap_len < SLIP_HEADER_LEN)
    {
        ErrorMessage("SLIP header length < captured len! (%d bytes)\n",
                     cap_len);
        return;
    }

    DecodeIP(p->pkt + SLIP_HEADER_LEN, cap_len - SLIP_HEADER_LEN, p);
}



/*
 * Function: DecodeRawPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decodes packets coming in raw on layer 2, like PPP.  Coded and
 *          in by Jed Pickle (thanks Jed!) and modified for a few little tweaks
 *          by me.
 *
 * Arguments: p => pointer to decoded packet struct 
 *            user => Utility pointer, unused
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodeRawPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n"););

    DecodeIP(pkt, p->pkth->caplen, p);

    return;
}



/*
 * Function: DecodeI4LRawIPPkt(Packet *, char *, struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decodes packets coming in raw on layer 2, like PPP.  Coded and
 *          in by Jed Pickle (thanks Jed!) and modified for a few little tweaks
 *          by me.
 *
 * Arguments: p => pointer to decoded packet struct
 *            user => Utility pointer, unused
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodeI4LRawIPPkt(Packet * p, struct pcap_pkthdr * pkthdr, u_int8_t * pkt)
{
    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n"););
    DecodeIP(pkt + 2, p->pkth->len - 2, p);

    return;
}



/*
 * Function: DecodeI4LCiscoIPPkt(Packet *, char *, 
 *                               struct pcap_pkthdr*, u_int8_t*)
 *
 * Purpose: Decodes packets coming in raw on layer 2, like PPP.  Coded and
 *          in by Jed Pickle (thanks Jed!) and modified for a few little tweaks
 *          by me.
 *
 * Arguments: p => pointer to decoded packet struct 
 *            user => Utility pointer, unused
 *            pkthdr => ptr to the packet header
 *            pkt => pointer to the real live packet data
 *
 * Returns: void function
 */
void DecodeI4LCiscoIPPkt(Packet *p, struct pcap_pkthdr *pkthdr, u_int8_t *pkt)
{
    bzero((char *) p, sizeof(Packet));

    p->pkth = pkthdr;
    p->pkt = pkt;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n"););

    DecodeIP(pkt + 4, p->pkth->caplen - 4, p);

    return;
}



/*
 * Function: DecodeIP(u_int8_t *, const u_int32_t, Packet *)
 *
 * Purpose: Decode the IP network layer
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *            p   => pointer to the packet decode struct
 *
 * Returns: void function
 */
void DecodeIP(u_int8_t * pkt, const u_int32_t len, Packet * p)
{
    u_int32_t ip_len;       /* length from the start of the ip hdr to the
                             * pkt end */
    u_int32_t hlen;             /* ip header length */
    u_int16_t csum;             /* checksum */
    Event event;                /* event */

    /* lay the IP struct over the raw data */
    p->iph = (IPHdr *) pkt;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Packet!\n"););

    /* do a little validation */
    if(len < IP_HEADER_LEN)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("IP header truncated! (%d bytes)\n", len);
        }
        p->iph = NULL;

        return;
    }

    /*
     * with datalink DLT_RAW it's impossible to differ ARP datagrams from IP.
     * So we are just ignoring non IP datagrams
     */
    if(IP_VER(p->iph) != 4)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("[!] WARNING: Not IPv4 datagram! "
                    "([ver: 0x%x][len: 0x%x])\n", 
                    IP_VER(p->iph), p->iph->ip_len);
        }
        if(pv.logbin_flag && pv.decode_alert_flag)
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_NOT_IPV4_DGRAM, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_NOT_IPV4_DGRAM_STR, NULL, &event);
            CallLogFuncs(p, DECODE_NOT_IPV4_DGRAM_STR, NULL, &event);

        }
        p->iph = NULL;
        pc.discards++;

        return;
    }

    /* set the IP datagram length */
    ip_len = ntohs(p->iph->ip_len);

    /* set the IP header length */
    hlen = IP_HLEN(p->iph) << 2;


    /* header length sanity check */
    if(hlen < IP_HEADER_LEN)
    {
        /* XXX: this is a bogus packet, perhaps we should generate an alert */
#ifdef DEBUG
        if(pv.verbose_flag)
            ErrorMessage("[!] WARNING: Bogus IP header length of %i bytes\n", 
                    hlen);
#endif
        if(pv.logbin_flag && pv.decode_alert_flag) 
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_IPV4_INVALID_HEADER_LEN, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_IPV4_INVALID_HEADER_LEN_STR, 
                    NULL, &event);
            CallLogFuncs(p, DECODE_IPV4_INVALID_HEADER_LEN_STR,
                    NULL, &event);

        }


        p->iph = NULL;
        pc.discards++;
        return;
    }

    if (ip_len != len)
    {
        if (ip_len > len) 
        {
#ifdef DEBUG
            if (pv.verbose_flag)
                ErrorMessage("[!] WARNING: IP Len field is %d bytes bigger"
                        " than captured length.\n"
                        "    (ip.len: %lu, cap.len: %lu)\n",
                        ip_len - len, ip_len, len);
#endif
            ip_len = len;
        }
        else
        {
#ifdef DEBUG
            if (pv.verbose_flag)
                ErrorMessage("[!] WARNING: IP Len field is %d bytes "
                        "smaller than captured length.\n"
                        "    (ip.len: %lu, cap.len: %lu)\n",
                        len - ip_len, ip_len, len);
#endif

        }
    }

    if(ip_len < hlen)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("[!] WARNING: IP dgm len (%d bytes) < IP hdr "
                    "len (%d bytes), packet discarded\n", ip_len, hlen);
        }

        if(pv.logbin_flag && pv.decode_alert_flag) 
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_IPV4_DGRAM_LT_IPHDR, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_IPV4_DGRAM_LT_IPHDR_STR, NULL, &event);
            CallLogFuncs(p, DECODE_IPV4_DGRAM_LT_IPHDR_STR, NULL, &event);
        }

        p->iph = NULL;
        pc.discards++;
        return;
    }


    if(pv.checksums_mode & DO_IP_CHECKSUMS)
    {
        /* routers drop packets with bad IP checksums, we don't really 
         * need to check them (should make this a command line/config
         * option
         */
        csum = in_chksum_ip((u_short *)p->iph, hlen);

        if(csum)
        {
            p->csum_flags |= CSE_IP;

            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Bad IP checksum\n"););
        }
#ifdef DEBUG
        else
        {
            DebugMessage(DEBUG_DECODE, "IP Checksum: OK\n");
        }
#endif /* DEBUG */
    }

    /* test for IP options */
    p->ip_options_len = hlen - IP_HEADER_LEN;

    if(p->ip_options_len > 0)
    {
        p->ip_options_data = pkt + IP_HEADER_LEN;
        DecodeIPOptions((pkt + IP_HEADER_LEN), p->ip_options_len, p);
    }
    else
    {
        p->ip_option_count = 0;
    }

    /* set the remaining packet length */
    ip_len -= hlen;

    /* check for fragmented packets */
    p->frag_offset = ntohs(p->iph->ip_off);

    /* 
     * get the values of the reserved, more 
     * fragments and don't fragment flags 
     */
    p->rf = (u_int8_t)((p->frag_offset & 0x8000) >> 15);
    p->df = (u_int8_t)((p->frag_offset & 0x4000) >> 14);
    p->mf = (u_int8_t)((p->frag_offset & 0x2000) >> 13);

    /* mask off the high bits in the fragment offset field */
    p->frag_offset &= 0x1FFF;

    if(p->frag_offset || p->mf)
    {
        /* set the packet fragment flag */
        p->frag_flag = 1;
        pc.frags++;
    }

    /* if this packet isn't a fragment */
    if(!(p->frag_flag))
    {
        /* set the packet fragment flag */
        p->frag_flag = 0;

        DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "IP header length: %lu\n", 
                    (unsigned long)hlen););

        switch(p->iph->ip_proto)
        {
            case IPPROTO_TCP:
                pc.tcp++;
                DecodeTCP(pkt + hlen, ip_len, p);
                ClearDumpBuf();
                return;

            case IPPROTO_UDP:
                pc.udp++;
                DecodeUDP(pkt + hlen, ip_len, p);
                ClearDumpBuf();
                return;

            case IPPROTO_ICMP:
                pc.icmp++;
                DecodeICMP(pkt + hlen, ip_len, p);
                ClearDumpBuf();
                return;

            default:
                pc.other++;
                p->data = pkt + hlen;
                p->dsize = (u_short) ip_len;
                ClearDumpBuf();
                return;
        }
    }
    else
    {
        /* set the payload pointer and payload size */
        p->data = pkt + hlen;
        p->dsize = (u_short) ip_len;
    }
}
/*
 * Function: DecodeIPOnly(u_int8_t *, const u_int32_t, Packet *)
 *
 * Purpose: Decode the IP network layer but not recurse
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *            p   => pointer to dummy packet decode struct
 *
 * Returns: void function
 */
int DecodeIPOnly(u_int8_t * pkt, const u_int32_t len, Packet * p)
{
    u_int32_t ip_len;       /* length from the start of the ip hdr to the
                             * pkt end */
    u_int32_t hlen;             /* ip header length */

    /* lay the IP struct over the raw data */
    p->orig_iph = (IPHdr *) pkt;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "DecodeIPOnly: ip header starts at: %p, "
                "length is %lu\n", p->orig_iph, (unsigned long) len););

    /* do a little validation */
    if(len < IP_HEADER_LEN)
    {
        ErrorMessage("ICMP Unreachable IP short header (%d bytes)\n", len);
        p->orig_iph = NULL;
        return(0);
    }

    /*
     * with datalink DLT_RAW it's impossible to differ ARP datagrams from IP.
     * So we are just ignoring non IP datagrams
     */
    if(IP_VER(p->orig_iph) != 4)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("[!] WARNING: ICMP Unreachable not IPv4 datagram "
                    "([ver: 0x%x][len: 0x%x])\n", 
                    IP_VER(p->orig_iph), p->orig_iph->ip_len);
        }

        p->orig_iph = NULL;

        return(0);
    }

    /* set the IP datagram length */
    ip_len = ntohs(p->orig_iph->ip_len);

    /* set the IP header length */
    hlen = IP_HLEN(p->orig_iph) << 2;

    if(len < hlen)
    {
        ErrorMessage("[!] WARNING: ICMP Unreachable IP len (%d bytes) < "
                "IP hdr len (%d bytes), packet discarded\n", ip_len, hlen);
        p->orig_iph = NULL;

        return(0);
    }

    p->ip_option_count = 0;

    /* set the remaining packet length */
    ip_len = len - hlen;

    /* check for fragmented packets */
    p->frag_offset = ntohs(p->orig_iph->ip_off);

    /* get the values of the reserved, more 
     * fragments and don't fragment flags 
     */
    p->rf = (u_int8_t)(p->frag_offset & 0x8000) >> 15;
    p->df = (u_int8_t)(p->frag_offset & 0x4000) >> 14;
    p->mf = (u_int8_t)(p->frag_offset & 0x2000) >> 13;

    /* mask off the high bits in the fragment offset field */
    p->frag_offset &= 0x1FFF;

    if(p->frag_offset || p->mf)
    {
        /* set the packet fragment flag */
        p->frag_flag = 1;

        /* set the payload pointer and payload size */
        p->data = pkt + hlen;
        p->dsize = (u_short) ip_len;
    }
    else
    {
        p->frag_flag = 0;

        DEBUG_WRAP(
                DebugMessage(DEBUG_DECODE, "ICMP Unreachable IP header length: "
                    "%lu\n", (unsigned long)hlen););

        switch(p->orig_iph->ip_proto)
        {
            case IPPROTO_TCP: /* decode the interesting part of the header */
                if(ip_len > 4)
                {
                    p->orig_tcph =(TCPHdr *)(pkt + hlen);

                    /* stuff more data into the printout data struct */
                    p->orig_sp = ntohs(p->orig_tcph->th_sport);
                    p->orig_dp = ntohs(p->orig_tcph->th_dport);
                }

                break;

            case IPPROTO_UDP:
                if(ip_len > 4)
                {
                    p->orig_udph = (UDPHdr *)(pkt + hlen);

                    /* fill in the printout data structs */
                    p->orig_sp = ntohs(p->orig_udph->uh_sport);
                    p->orig_dp = ntohs(p->orig_udph->uh_dport);
                }

                break;

            case IPPROTO_ICMP:
                if(ip_len > 4)
                {
                    p->orig_icmph = (ICMPHdr *) (pkt+hlen);
                }

                break;
        }
    }

    return(1);
}



/*
 * Function: DecodeTCP(u_int8_t *, const u_int32_t, Packet *)
 *
 * Purpose: Decode the TCP transport layer
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *            p   => Pointer to packet decode struct
 *
 * Returns: void function
 */
void DecodeTCP(u_int8_t * pkt, const u_int32_t len, Packet * p)
{
    struct pseudoheader       /* pseudo header for TCP checksum calculations */
    {
        u_int32_t sip, dip;   /* IP addr */
        u_int8_t  zero;       /* checksum placeholder */
        u_int8_t  protocol;   /* protocol number */
        u_int16_t tcplen;     /* tcp packet length */
    };
    u_int32_t hlen;            /* TCP header length */
    u_short csum;              /* checksum */
    struct pseudoheader ph;    /* pseudo header declaration */
    Event event;

    if(len < 20)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("[!] WARNING: TCP packet (len = %d) cannot contain "
                    "20 byte header\n", len);
        }

        if(pv.logbin_flag && pv.decode_alert_flag) 
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_TCP_DGRAM_LT_TCPHDR, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_TCP_DGRAM_LT_TCPHDR_STR, NULL, &event);
            CallLogFuncs(p, DECODE_TCP_DGRAM_LT_TCPHDR_STR, NULL, &event);
        }

        p->tcph = NULL;
        pc.discards++;
        return;
    }

    /* lay TCP on top of the data cause there is enough of it! */
    p->tcph = (TCPHdr *) pkt;

    /* multiply the payload offset value by 4 */
    hlen = TCP_OFFSET(p->tcph) << 2;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "TCP th_off is %d, passed len is %lu\n", 
                TCP_OFFSET(p->tcph), (unsigned long)len););

    if(hlen < 20)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("[!] WARNING: TCP Data Offset %d < 5 \n",
                    TCP_OFFSET(p->tcph));
        }



        if(pv.logbin_flag && pv.decode_alert_flag)
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_TCP_INVALID_OFFSET, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_TCP_INVALID_OFFSET_STR, NULL, &event);
            CallLogFuncs(p, DECODE_TCP_INVALID_OFFSET_STR, NULL, &event);
        }

        p->tcph = NULL;
        pc.discards++;

        return;
    }

    if(pv.checksums_mode & DO_TCP_CHECKSUMS)
    {
        /* setup the pseudo header for checksum calculation */
        ph.sip = (u_int32_t)(p->iph->ip_src.s_addr);
        ph.dip = (u_int32_t)(p->iph->ip_dst.s_addr);
        ph.zero = 0;
        ph.protocol = p->iph->ip_proto;
        ph.tcplen = htons((u_short)len);

        /* if we're being "stateless" we probably don't care about the TCP 
         * checksum, but it's not bad to keep around for shits and giggles */
        /* calculate the checksum */
        csum = in_chksum_tcp((u_int16_t *)&ph, (u_int16_t *)(p->tcph), len);
        
        if(csum)
        {
            p->csum_flags |= CSE_TCP;

            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Bad TCP checksum\n"););

        }
        else
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE,"TCP Checksum: OK\n"););
        }
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "tcp header starts at: %p\n", p->tcph););

    /* if options are present, decode them */
    p->tcp_options_len = hlen - 20;

    if(p->tcp_options_len > 0)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "%lu bytes of tcp options....\n", 
                    (unsigned long)(p->tcp_options_len)););

        p->tcp_options_data = pkt + 20;
        DecodeTCPOptions((u_int8_t *) (pkt + 20), p->tcp_options_len, p);
    }
    else
    {
        p->tcp_option_count = 0;
    }

    /* stuff more data into the printout data struct */
    p->sp = ntohs(p->tcph->th_sport);
    p->dp = ntohs(p->tcph->th_dport);

    /* set the data pointer and size */
    p->data = (u_int8_t *) (pkt + hlen);

    if(hlen < len)
    {
        p->dsize = (u_short)(len - hlen);
    }
    else
    {
        p->dsize = 0;
    }
}


/*
 * Function: DecodeUDP(u_int8_t *, const u_int32_t, Packet *)
 *
 * Purpose: Decode the UDP transport layer
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *            p   => pointer to decoded packet struct  
 *
 * Returns: void function
 */
void DecodeUDP(u_int8_t * pkt, const u_int32_t len, Packet * p)
{
    struct pseudoheader 
    {
        u_int32_t sip, dip;
        u_int8_t  zero;
        u_int8_t  protocol;
        u_int16_t udplen;
    };
    u_short csum;
    struct pseudoheader ph;
    Event event;

    if(len < sizeof(UDPHdr))
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("[!] WARNING: Truncated UDP header (%d bytes)\n", len);
        }

        if(pv.logbin_flag && pv.decode_alert_flag) 
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_UDP_DGRAM_LT_UDPHDR, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_UDP_DGRAM_LT_UDPHDR_STR, 
                    NULL, &event);
            CallLogFuncs(p, DECODE_UDP_DGRAM_LT_UDPHDR_STR,
                    NULL, &event);
        }

        p->udph = NULL;
        pc.discards++;

        return;
    }

    /* set the ptr to the start of the UDP header */
    p->udph = (UDPHdr *) pkt;

    if(pv.checksums_mode & DO_UDP_CHECKSUMS)
    {
        /* look at the UDP checksum to make sure we've got a good packet */
        ph.sip = (u_int32_t)(p->iph->ip_src.s_addr);
        ph.dip = (u_int32_t)(p->iph->ip_dst.s_addr);
        ph.zero = 0;
        ph.protocol = p->iph->ip_proto;
        ph.udplen = htons((u_short)len);

        csum = in_chksum_udp((u_int16_t *)&ph, (u_int16_t *)(p->udph), len);

        if(csum)
        {
            p->csum_flags |= CSE_UDP;
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Bad UDP Checksum\n"););
        }
        else
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "UDP Checksum: OK\n"););
        }
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "UDP header starts at: %p\n", p->udph););

    /* fill in the printout data structs */
    p->sp = ntohs(p->udph->uh_sport);
    p->dp = ntohs(p->udph->uh_dport);

    p->data = (u_int8_t *) (pkt + UDP_HEADER_LEN);

    if((len - UDP_HEADER_LEN) > 0)
    {
        p->dsize = (u_short)(len - UDP_HEADER_LEN);
    }
    else
    {
        p->dsize = 0;
    }
}



/*
 * Function: DecodeICMP(u_int8_t *, const u_int32_t, Packet *)
 *
 * Purpose: Decode the ICMP transport layer
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *            p   => pointer to the decoded packet struct
 *
 * Returns: void function
 */
void DecodeICMP(u_int8_t * pkt, const u_int32_t len, Packet * p)
{
    u_int16_t csum;
    Event event;
    u_int16_t orig_p_caplen;

    if(len < ICMP_HEADER_LEN)
    {
        if(pv.verbose_flag)
        {
            ErrorMessage("[!] WARNING: Truncated ICMP header "
                    "(%d bytes)\n", len);
        }

        p->icmph = NULL;
        pc.discards++;

        return;
    }

    /* set the header ptr first */
    p->icmph = (ICMPHdr *) pkt;

    switch (p->icmph->type)
    {
        case ICMP_ECHOREPLY:
        case ICMP_DEST_UNREACH:
        case ICMP_SOURCE_QUENCH:
        case ICMP_REDIRECT:
        case ICMP_ECHO:
        case ICMP_ROUTER_ADVERTISE:
        case ICMP_ROUTER_SOLICIT:
        case ICMP_TIME_EXCEEDED:
        case ICMP_PARAMETERPROB:
        case ICMP_INFO_REQUEST:
        case ICMP_INFO_REPLY:
            if (len < 8)
            {
                if(pv.verbose_flag)
                {
                    ErrorMessage("[!] WARNING: Truncated ICMP "
                            "header(%d bytes)\n", len);
                }

                if(pv.logbin_flag && pv.decode_alert_flag)
                {
                    SetEvent(&event, GENERATOR_SNORT_DECODE, 
                            DECODE_ICMP_DGRAM_LT_ICMPHDR, 1, 0, 5, 0);
                    CallAlertFuncs(p, DECODE_ICMP_DGRAM_LT_ICMPHDR_STR, 
                            NULL, &event);
                    CallLogFuncs(p, DECODE_ICMP_DGRAM_LT_ICMPHDR_STR,
                            NULL, &event);
                }

                p->icmph = NULL;
                pc.discards++;

                return;
            }

            break;

        case ICMP_TIMESTAMP:
        case ICMP_TIMESTAMPREPLY:
            if (len < 20)
            {
                if(pv.verbose_flag)
                {
                    ErrorMessage("[!] WARNING: Truncated ICMP "
                            "header(%d bytes)\n", len);
                }

                if(pv.logbin_flag && pv.decode_alert_flag)
                {
                    SetEvent(&event, GENERATOR_SNORT_DECODE, 
                            DECODE_ICMP_DGRAM_LT_TIMESTAMPHDR, 1, 0, 5, 0);
                    CallAlertFuncs(p, DECODE_ICMP_DGRAM_LT_TIMESTAMPHDR_STR, 
                            NULL, &event);
                    CallLogFuncs(p, DECODE_ICMP_DGRAM_LT_TIMESTAMPHDR_STR,
                            NULL, &event);
                }

                p->icmph = NULL;
                pc.discards++;

                return;
            }

            break;

        case ICMP_ADDRESS:
        case ICMP_ADDRESSREPLY:
            if (len < 12)
            {
                if(pv.verbose_flag)
                {
                    ErrorMessage("[!] WARNING: Truncated ICMP "
                            "header(%d bytes)\n", len);
                }


                if(pv.logbin_flag && pv.decode_alert_flag)
                {
                    SetEvent(&event, GENERATOR_SNORT_DECODE, 
                            DECODE_ICMP_DGRAM_LT_ADDRHDR, 1, 0, 5, 0);
                    CallAlertFuncs(p,DECODE_ICMP_DGRAM_LT_ADDRHDR_STR , 
                            NULL, &event);
                    CallLogFuncs(p, DECODE_ICMP_DGRAM_LT_ADDRHDR_STR,
                            NULL, &event);
                }

                p->icmph = NULL;
                pc.discards++;

                return;
            }

            break;
    }


    if(pv.checksums_mode & DO_ICMP_CHECKSUMS)
    {
        csum = in_chksum_icmp((u_int16_t *)p->icmph, len);

        if(csum)
        {
            p->csum_flags |= CSE_ICMP;

            DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "Bad ICMP Checksum\n"););
        }
        else
        {
            DEBUG_WRAP(DebugMessage(DEBUG_DECODE,"ICMP Checksum: OK\n"););
        }
    }

    p->dsize = (u_short)(len - ICMP_HEADER_LEN);
    p->data = pkt + ICMP_HEADER_LEN;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "ICMP type: %d   code: %d\n", 
                p->icmph->code, p->icmph->type););

    switch(p->icmph->type)
    {
        case ICMP_ECHOREPLY:
            /* setup the pkt id ans seq numbers */
            p->dsize -= sizeof(struct idseq);
            p->data += sizeof(struct idseq);
            break;

        case ICMP_ECHO:
            /* setup the pkt id and seq numbers */
            p->dsize -= sizeof(struct idseq);   /* add the size of the 
                                                 * echo ext to the data
                                                 * ptr and subtract it 
                                                 * from the data size */
            p->data += sizeof(struct idseq);
            break;

        case ICMP_DEST_UNREACH:
            {
                /* if unreach packet is smaller than expected! */
                if(len < 16)
                {
                    if(pv.verbose_flag)
                        ErrorMessage("[!] WARNING: Truncated ICMP-UNREACH "
                                "header (%d bytes)\n", len);

                    /* if it is less than 8 we are in trouble */
                    if(len < 8)
                        break;
                }

                orig_p_caplen = len - 8;

                if(!DecodeIPOnly(pkt + 8, orig_p_caplen, p))
                {
                    if(pv.use_rules && pv.decode_alert_flag)
                    {
                        SetEvent(&event, GENERATOR_SNORT_DECODE, 
                                DECODE_IPV4_DGRAM_UNKNOWN, 1, 0, 5, 0);
                        CallAlertFuncs(p, DECODE_IPV4_DGRAM_UNKNOWN_STR, 
                                NULL, &event);
                        CallLogFuncs(p, DECODE_IPV4_DGRAM_UNKNOWN_STR,
                                NULL, &event);
                    }
                }
            }

            break;

        case ICMP_REDIRECT:
            {
                /* if unreach packet is smaller than expected! */
                if(p->dsize < 28)
                {
                    if(pv.verbose_flag)
                        ErrorMessage("[!] WARNING: Truncated ICMP-REDIRECT "
                                "header (%d bytes)\n", len);

                    /* if it is less than 8 we are in trouble */
                    if(p->dsize < 8)
                        break;
                }

                orig_p_caplen = p->dsize - 8;

                if(!DecodeIPOnly(pkt + 8, orig_p_caplen, p))
                {
                    if(pv.use_rules && pv.decode_alert_flag)
                    {
                        SetEvent(&event, GENERATOR_SNORT_DECODE, 
                                DECODE_IPV4_DGRAM_UNKNOWN, 1, 0, 5, 0);
                        CallAlertFuncs(p, DECODE_IPV4_DGRAM_UNKNOWN_STR, 
                                NULL, &event);
                        CallLogFuncs(p, DECODE_IPV4_DGRAM_UNKNOWN_STR,
                                NULL, &event);
                    }
                }
            }

            break;
    }

    return;
}



/*
 * Function: DecodeARP(u_int8_t *, u_int32_t, Packet *)
 *
 * Purpose: Decode ARP stuff
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *            p   => pointer to decoded packet struct
 *
 * Returns: void function
 */
void DecodeARP(u_int8_t * pkt, u_int32_t len, Packet * p)
{
    Event event;

    p->ah = (EtherARP *) pkt;

    if(len < sizeof(EtherARP))
    {
        if(pv.verbose_flag)
            LogMessage("Truncated packet\n");

        if(pv.logbin_flag && pv.decode_alert_flag)
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_ARP_TRUNCATED, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_ARP_TRUNCATED_STR, NULL, &event);
            CallLogFuncs(p, DECODE_ARP_TRUNCATED_STR, NULL, &event);
        }

        pc.discards++;
        return;
    }

    return;
}

/*
 * Function: DecodeEapol(u_int8_t *, u_int32_t, Packet *)
 *
 * Purpose: Decode 802.1x eapol stuff
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *            p   => pointer to decoded packet struct
 *
 * Returns: void function
 */
void DecodeEapol(u_int8_t * pkt, u_int32_t len, Packet * p)
{
    Event event;
    p->eplh = (EtherEapol *) pkt;
    if(len < sizeof(EtherEapol))
    {
        if(pv.verbose_flag)
            printf("Truncated packet\n");

        if(pv.logbin_flag && pv.decode_alert_flag)
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_EAPOL_TRUNCATED, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_EAPOL_TRUNCATED_STR, NULL, &event);
            CallLogFuncs(p, DECODE_EAPOL_TRUNCATED_STR, NULL, &event);
        }

        pc.discards++;
        return;
    }
    if (p->eplh->eaptype == EAPOL_TYPE_EAP) {
        DecodeEAP(pkt + sizeof(EtherEapol), len - sizeof(EtherEapol), p);
    }    
    else if(p->eplh->eaptype == EAPOL_TYPE_KEY) {
        DecodeEapolKey(pkt + sizeof(EtherEapol), len - sizeof(EtherEapol), p);
    }
    return;
}

/*
 * Function: DecodeEapolKey(u_int8_t *, u_int32_t, Packet *)
 *
 * Purpose: Decode 1x key setup
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *            p   => pointer to decoded packet struct
 *
 * Returns: void function
 */
void DecodeEapolKey(u_int8_t * pkt, u_int32_t len, Packet * p)
{
    Event event;
    p->eapolk = (EapolKey *) pkt;
    if(len < sizeof(EapolKey))
    {
        if(pv.verbose_flag)
            printf("Truncated packet\n");

        if(pv.logbin_flag && pv.decode_alert_flag)
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_EAPKEY_TRUNCATED, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_EAPKEY_TRUNCATED_STR, 
                    NULL, &event);
            CallLogFuncs(p, DECODE_EAPKEY_TRUNCATED_STR,
                    NULL, &event);
        }

        pc.discards++;
        return;
    }

    return;  
}

/*
 * Function: DecodeEAP(u_int8_t *, u_int32_t, Packet *)
 *
 * Purpose: Decode Extensible Authentication Protocol
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *            p   => pointer to decoded packet struct
 *
 * Returns: void function
 */
void DecodeEAP(u_int8_t * pkt, const u_int32_t len, Packet * p)
{
    Event event;
    p->eaph = (EAPHdr *) pkt;
    if(len < sizeof(EAPHdr))
    {
        if(pv.verbose_flag)
            printf("Truncated packet\n");

        if(pv.logbin_flag && pv.decode_alert_flag)
        {
            SetEvent(&event, GENERATOR_SNORT_DECODE, 
                    DECODE_EAP_TRUNCATED, 1, 0, 5, 0);
            CallAlertFuncs(p, DECODE_EAP_TRUNCATED_STR, NULL, &event);
            CallLogFuncs(p, DECODE_EAP_TRUNCATED_STR, NULL, &event);
        }

        pc.discards++;
        return;
    }
    if (p->eaph->code == EAP_CODE_REQUEST ||
            p->eaph->code == EAP_CODE_RESPONSE) {
        p->eaptype = pkt + sizeof(EAPHdr);
    }
    return;
}


/*
 * Function: DecodeIPV6(u_int8_t *, u_int32_t)
 *
 * Purpose: Just like IPX, it's just for counting.
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *
 * Returns: void function
 */
void DecodeIPV6(u_int8_t *pkt, u_int32_t len)
{
    if(pv.verbose_flag)
    {
        puts("IPV6 packet");
    }
    return;
}


/*
 * Function: DecodeIPX(u_int8_t *, u_int32_t)
 *
 * Purpose: Well, it doesn't do much of anything right now...
 *
 * Arguments: pkt => ptr to the packet data
 *            len => length from here to the end of the packet
 *
 * Returns: void function
 *
 */
void DecodeIPX(u_int8_t *pkt, u_int32_t len)
{
    if(pv.verbose_flag)
    {
        puts("IPX packet");
    }
    return;
}


/*
 * Function: DecodeTCPOptions(u_int8_t *, u_int32_t, Packet *)
 *
 * Purpose: Fairly self explainatory name, don't you think?
 *
 * Arguments: o_list => ptr to the option list
 *            o_len => length of the option list
 *            p     => pointer to decoded packet struct
 *
 * Returns: void function
 */
void DecodeTCPOptions(u_int8_t *o_list, u_int32_t o_len, Packet *p)
{
    u_int8_t *option_ptr;
    u_int32_t bytes_processed;
    u_int32_t current_option;
    u_char done = 0;

    if(TCP_OFFSET(p->tcph) == 5)
        return;

    option_ptr = o_list;
    bytes_processed = 0;
    current_option = 0;

    while((bytes_processed < o_len) && (current_option < 40) && !done)
    {
        p->tcp_options[current_option].code = *option_ptr;

        switch(*option_ptr)
        {
            case TCPOPT_NOP:
            case TCPOPT_EOL:
                if(*option_ptr == TCPOPT_EOL)
                    done = 1;

                p->tcp_options[current_option].len = 0;
                p->tcp_options[current_option].data = NULL;
                bytes_processed++;
                current_option++;
                option_ptr++;

                break;

            case TCPOPT_SACKOK:
                p->tcp_options[current_option].len = 0;
                p->tcp_options[current_option].data = NULL;
                bytes_processed += 2;
                option_ptr += 2;
                current_option++;
                break;

            case TCPOPT_WSCALE:
                p->tcp_options[current_option].len = 3;
                p->tcp_options[current_option].data = option_ptr + 2;
                option_ptr += 3;
                bytes_processed += 3;
                current_option++;
                break;

            default:
                p->tcp_options[current_option].len = *(option_ptr + 1);

                if(p->tcp_options[current_option].len > 40)
                {
                    p->tcp_options[current_option].len = 40;
                }
                else if( p->tcp_options[current_option].len == 0)
                {
                    /* got a bad option, we're all done */
                    done = 1;
                    p->tcp_lastopt_bad = 1;
                }

                p->tcp_options[current_option].data = option_ptr + 2;
                option_ptr += p->tcp_options[current_option].len;
                bytes_processed += p->tcp_options[current_option].len;
                current_option++;
                break;
        }
    }

    if(bytes_processed > o_len)
    {
        p->tcp_options[current_option].len =
            p->tcp_options[current_option].len - (bytes_processed - o_len);
        /*
         * in reality shouldn't happen until we got the option type and len
         * on the packet header boundary.. then we just drop last option (as
         * it is corrupted anyway).
         */
        if(p->tcp_options[current_option].len < 0)
            current_option--;
    }

    p->tcp_option_count = current_option;

    return;
}


/*
 * Function: DecodeIPOptions(u_int8_t *, u_int32_t, Packet *)
 *
 * Purpose: Once again, a fairly self-explainatory name
 *
 * Arguments: o_list => ptr to the option list
 *            o_len => length of the option list
 *            p     => pointer to decoded packet struct
 *
 * Returns: void function
 */
void DecodeIPOptions(u_int8_t *o_list, u_int32_t o_len, Packet *p)
{
    u_int8_t *option_ptr;
    u_int32_t bytes_processed;
    u_int32_t current_option;
    u_char done = 0;

    option_ptr = o_list;
    bytes_processed = 0;
    current_option = 0;

    if(IP_HLEN(p->iph) == 5)
        return;

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE,
                "Decoding %d bytes of IP options\n", o_len););

    while((bytes_processed < o_len) && (current_option < 40) && !done)
    {
        DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "    => %d bytes processed\n",
                    bytes_processed););

        p->ip_options[current_option].code = *option_ptr;

        switch(*option_ptr)
        {
            case IPOPT_RTRALT:
            case IPOPT_NOP:
            case IPOPT_EOL:
                /* if we hit an EOL, we're done */
                if(*option_ptr == IPOPT_EOL)
                    done = 1;

                p->ip_options[current_option].len = 0;
                p->ip_options[current_option].data = NULL;
                bytes_processed++;
                current_option++;
                option_ptr++;

                break;

            default:
                p->ip_options[current_option].len = *(option_ptr + 1);

                if(p->ip_options[current_option].len > 40)
                {
                    p->ip_options[current_option].len = 40;
                }
                else if(p->ip_options[current_option].len == 0)
                {
                    /* 
                     * this shouldn't happen, indicates a bad option list 
                     * so we bail
                     */
                    done = 1;
                    p->ip_lastopt_bad = 1;
                }

                p->ip_options[current_option].data = option_ptr + 2;
                option_ptr += p->ip_options[current_option].len;
                DEBUG_WRAP(DebugMessage(DEBUG_DECODE,
                            "        => Adding %d bytes\n", 
                            p->ip_options[current_option].len););
                bytes_processed += p->ip_options[current_option].len;
                current_option++;
                break;

        }
    }

    DEBUG_WRAP(DebugMessage(DEBUG_DECODE, "    => %d total bytes processed\n",
                bytes_processed););

    if(bytes_processed > o_len)
    {
        p->ip_options[current_option].len =
            p->ip_options[current_option].len - (bytes_processed - o_len);
        if(p->ip_options[current_option].len < 0)
            current_option--;
    }

    p->ip_option_count = current_option;

    return;
}

