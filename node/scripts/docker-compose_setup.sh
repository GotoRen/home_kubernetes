#!/bin/sh

pip3 install --upgrade pip
pip3 list --outdated | awk 'NR>2 {print $1}' | xargs pip install -U

pip3 install docker-compose

pip3 list
