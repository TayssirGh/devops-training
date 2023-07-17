#!/bin/bash

CLUSTER_NAME="devopsclus"
MASTER_NODE_PORT="6443"
LOAD_BALANCER_PORT_HTTP="80"
LOAD_BALANCER_PORT_HTTPS="443"
VOLUME_BINDING="/tmp/dataCluster:/data"

# Create the k3d cluster
sudo k3d cluster create $CLUSTER_NAME \
    --api-port $MASTER_NODE_PORT \
    --servers 1 \
    --agents 1 \
    --port "$LOAD_BALANCER_PORT_HTTP:$LOAD_BALANCER_PORT_HTTP" \
    --port "$LOAD_BALANCER_PORT_HTTPS:$LOAD_BALANCER_PORT_HTTPS" \
    --volume "$VOLUME_BINDING"

# Set the kubectl context to the new cluster
sudo k3d kubeconfig merge $CLUSTER_NAME --kubeconfig-switch-context

# Verify the cluster
kubectl cluster-info
kubectl get nodes
