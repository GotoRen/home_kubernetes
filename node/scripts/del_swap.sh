#!/bin/sh

dphys-swapfile swapoff
dphys-swapfile uninstall
update-rc.d dphys-swapfile remove

systemctl daemon-reload
systemctl restart kubelet
systemctl status kubelet
