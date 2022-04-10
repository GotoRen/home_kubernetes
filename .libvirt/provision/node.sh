#!/bin/sh

sudo apt update && sudo apt upgrade -y
sudo apt install -y dnsutils iperf3 traceroute

echo "10.0.100.10 master" >> /etc/hosts
echo "10.0.100.11 node-1" >> /etc/hosts
echo "10.0.100.12 node-2" >> /etc/hosts
echo "10.0.100.13 node-3" >> /etc/hosts

