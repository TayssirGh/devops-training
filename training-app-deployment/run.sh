#!/bin/bash

k3d cluster delete k3d-devopscluster 

./init-k3d-cluster.sh

kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/controller.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml

kubectl wait --namespace kube-system \
 --for=condition=ready pod \
 --selector=app.kubernetes.io/component=controller \
 --timeout=-1s

kubectl wait --namespace ingress-nginx \
 --for=condition=ready pod \
 --selector=app.kubernetes.io/component=controller \
 --timeout=-1s

kustomize build | kubectl apply -f -

kubectl apply -k .


kubectl exec -it backend-deployment-7848ffcfcd-rsqhk -n training-app-backend-prod -c backend -- ls /app



kubectl cp ./tmp/api.js training-app-backend-prod/backend-deployment-7848ffcfcd-rsqhk:/app/config/api.js -c backend -n training-app-backend-prod
