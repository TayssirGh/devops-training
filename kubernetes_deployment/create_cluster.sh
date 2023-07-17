#!/bin/bash
# export KUBECONFIG=~/.kube/config

 k3d cluster delete clusster

 k3d cluster create --config create_cluster.yaml
clustername=clusster
cd ~/.kube
 k3d kubeconfig get ${clustername} > config