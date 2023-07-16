#!/bin/bash
# export KUBECONFIG=~/.kube/config
# clustername=clusster
# cd ~/.kube
# k3d kubeconfig get ${clustername} > config
sudo k3d cluster delete clusster

sudo k3d cluster create --config create_cluster.yaml
