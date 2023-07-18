#!/bin/bash
cd ../
export KUBECONFIG=~/.kube/config

sudo k3d cluster delete clusster

sudo k3d cluster create --config create_cluster.yaml

# sudo k3d kubeconfig merge clusster --kubeconfig-switch-context
clustername=clusster
cd ~/.kube
sudo k3d kubeconfig get ${clustername} > config

sudo kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/controller.yaml
sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml


sudo kubectl wait --namespace ingress-nginx \
 --for=condition=ready pod \
 --selector=app.kubernetes.io/component=controller \
 --timeout=-1s

sudo helm install demochart ./helm_chart --dry-run

sudo helm install demochart ./helm_chart