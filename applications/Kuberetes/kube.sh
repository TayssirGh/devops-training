#! bin/bash

#deleting the cluster if it already exist 
  
CLUSTER_NAME="qr-app"

# Check if the cluster exists
if k3d cluster list | grep -q "$CLUSTER_NAME"; then
    # Delete the cluster
    echo "Cluster already exists"
    k3d cluster delete $CLUSTER_NAME
    echo "Cluster $CLUSTER_NAME deleted."
    echo "creating a new cluster"
fi

#mkdir -p  ~/usr/kube-volumes/devops-training
# chmod 770  /usr/kube-volumes/

#creating the local directory 
sudo mkdir -p ~/usr/kube-volumes/devops-training
k3d cluster create $CLUSTER_NAME \
    --agents 1 \
    -p "80:80@loadbalancer" \
    -p "443:443@loadbalancer" \
    --volume ~/usr/kube-volumes/devops-training:/data    
