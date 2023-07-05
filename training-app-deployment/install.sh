#!bin/bash

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

kubectl create ns training-app-backend-prod

kubectl create ns training-app-frontend-prod

kubectl create configmap frontconfig --from-file=../applications/website/src/assets/configs/app-config.json -n training-app-frontend-prod

bash seal-secret.sh k8d-secret-backend k8d-secret-qr



for confile in sealed-*.yml *-deployment.yml *-service.yml; 
do 
    kubectl apply -f $confile
done

kubectl apply -f ingress.yml