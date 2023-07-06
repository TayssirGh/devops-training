#!bin/bash

cd training-app-deployment

k3d cluster delete dev

k3d cluster create --config config.yml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml

kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/controller.yaml

kubectl wait --namespace kube-system \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=-1s

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=-1s

bash seal-secret.sh k8s-secret-backend k8s-secret-qr

kustomize build | kubectl apply -f -

for confile in sealed-*.yml; 
do 
    kubectl apply -f $confile
done