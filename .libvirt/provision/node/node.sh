#!/bin/sh

sudo apt update && sudo apt upgrade -y
sudo apt install -y dnsutils iperf3 traceroute
sudo apt install -y libssl-dev
sudo apt install -y build-essential zlib1g-dev libffi-dev libbz2-dev libreadline-dev libsqlite3-dev

cat /etc/os-release
hostnamectl
