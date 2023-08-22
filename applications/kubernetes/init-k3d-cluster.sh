#!/usr/bin/env bash
  
### NOTE : Kubectl is supposed to be installed ###

# Checking if the cluster already exists and deleteting it before recreation 
CLUSTER_NAME="qr-app"
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
mkdir -p ~/usr/kube-volumes/devops-training
k3d cluster create $CLUSTER_NAME \
    --agents 1 \
    -p "80:80@loadbalancer" \
    -p "443:443@loadbalancer" \
    --volume ~/usr/kube-volumes/devops-training:/data    
    #--api-port 6444 \

#WARNING : this file is executed with sudo => 
k3d kubeconfig get $CLUSTER_NAME > ~/.kube/config


#k3d kubeconfig merge $CLUSTER_NAME --kubeconfig-switch-context
 
#deploying the sealedsecrets controller 

kubectl apply -f ./controller-v0.19.1.yaml 