#!/bin/bash

  echo "[TASK 7] Pull required containers"
  kubeadm config images pull >/dev/null 2>&1

  echo "[TASK 8] Initialize Kubernetes Cluster"
  kubeadm init --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors=all >> /root/kubeinit.log 2>&1

  echo "[TASK 9] Copy kube admin config to root user .kube directory"
  mkdir /root/.kube
  cp /etc/kubernetes/admin.conf /root/.kube/config

  echo "[TASK 10] Deploy Flannel network"
  kubectl apply -f  https://projectcalico.docs.tigera.io/manifests/calico.yaml > /dev/null 2>&1

  echo "[TASK 11] Generate and save cluster join command to /joincluster.sh"
  joinCommand=$(kubeadm token create --print-join-command 2>/dev/null)
  echo "$joinCommand --ignore-preflight-errors=all" > /joincluster.sh
