#!/bin/sh

journalctl -l -u kubelet
journalctl -xe | grep kubelet
journalctl -xeu kubelet
