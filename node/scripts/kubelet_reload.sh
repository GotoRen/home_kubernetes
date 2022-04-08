#!/bin/sh

kubeadm reset

rm -rf /var/lib/cni
rm -rf /etc/kubernetes/*
rm -rf /var/lib/etcd/

kill -9 $(sudo lsof -t -i:10250)

systemctl daemon-reload
systemctl restart kubelet
systemctl status kubelet
