#!/bin/bash
# export KUBECONFIG=~/.kube/config

sudo k3d cluster delete clusster

sudo k3d cluster create --config create_cluster.yaml
# clustername=clusster
# cd ~/.kube
# sudo k3d kubeconfig get ${clustername} > config