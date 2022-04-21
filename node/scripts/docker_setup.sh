#!/bin/sh

sudo curl -sSL https://get.docker.com | sh

sudo usermod -aG docker $(whoami)

sudo reboot

sudo systemctl enable docker
