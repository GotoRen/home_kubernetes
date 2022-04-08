#!/bin/sh

kubeadm reset

rm -rf /etc/kubernetes/*
rm -rf /var/lib/etcd/

kill -9 $(lsof -t -i:10250)
