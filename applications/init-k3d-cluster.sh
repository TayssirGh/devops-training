#!/bin/bash

if k3d cluster list | grep comwork-cluster ; then 
    echo "Cluster comwork-cluster already exists"

else
    echo "Cluster comwork-cluster does not exist. Creating it."
    k3d cluster create comwork-cluster --agents 1 --servers 1 -p 80:80@loadbalancer -p 443:443@loadbalancer -v $(pwd)/clusterData:/data
fi 

k3d kubeconfig merge comwork-cluster --kubeconfig-merge-default --kubeconfig-switch-context 

# echo "setting comwork-cluster as context"
# kubectl config use-context k3d-comwork-cluster

echo "____________________________________________________________"

echo "init-k3d-cluster.sh finished successfully"
echo "____________________________________________________________"


# ref : https://k3d.io/v5.3.0/usage/kubeconfig/