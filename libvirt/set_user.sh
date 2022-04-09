#!/bin/sh

sudo su -

adduser ren

mkdir -m 700 /home/ren/.ssh
touch /home/ren/.ssh/authorized_keys
chmod 600 /home/ren/.ssh/authorized_keys
chown -R ren:ren /home/ren/.ssh/

usermod -G sudo ren
