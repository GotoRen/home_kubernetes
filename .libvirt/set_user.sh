#!/bin/sh

USER=ren

sudo su -

adduser ${USER}

mkdir -m 700 /home/${USER}/.ssh
touch /home/${USER}/.ssh/authorized_keys
chmod 600 /home/${USER}/.ssh/authorized_keys
chown -R ${USER}:${USER} /home/${USER}/.ssh/

usermod -G sudo ${USER}
