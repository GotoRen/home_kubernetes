#!/bin/sh

### declaration interface
internal='eth0'
external='wlan0'

### IP forwarding
#echo 1 > /proc/sys/net/ipv4/ip_forward

### iptables
iptables -t nat -A POSTROUTING -o $external -j MASQUERADE
iptables -A FORWARD -i $external -o $internal -m state --state RELATED,ESTABLISHED -J ACCEPT
iptables -A FORWARD -i $internal -o $external -j ACCEPT
iptables-save

systemctl restart isc-dhcp-server
systemctl status isc-dhcp-server

cat /var/lib/dhcp/dhcpd.leases
