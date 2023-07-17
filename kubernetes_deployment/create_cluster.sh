#!/bin/sh
# export KUBECONFIG=~/.kube/config

sudo k3d cluster delete clusster

sudo k3d cluster create --config create_cluster.yaml

sudo k3d kubeconfig merge clusster --kubeconfig-switch-context
# clustername=clusster
# cd ~/.kube
# sudo k3d kubeconfig get ${clustername} > config