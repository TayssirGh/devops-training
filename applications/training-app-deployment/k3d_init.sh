#!/bin/bash

# Ensure k3d is installed
if ! command -v k3d &> /dev/null; then
    echo "Error: k3d is not installed. Please install k3d (https://k3d.io/#installation) before running this script."
    exit 1
fi

# Define cluster name
CLUSTER_NAME="devops-training-cluster"

# Create k3d cluster with one master node, one worker node, and load balancer
k3d cluster create $CLUSTER_NAME --api-port 6550 --servers 1 --agents 1 --port '80:80@loadbalancer' --port '443:443@loadbalancer' --volume '/tmp/cluster_data:/data'

# Mount a volume for data persistence
k3d kubeconfig merge $CLUSTER_NAME --kubeconfig-switch-context

# Display cluster info
echo "Cluster $CLUSTER_NAME is ready."
echo "You can access it using 'kubectl' commands."
