cd training-app-deployment

k3d cluster delete devopsTraining

k3d cluster create  devopsTraining --config k3d-config.yml

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

kubectl create ns training-app-backend-prod 
kubectl create ns training-app-frontend-prod 

source seal-secrets.sh

kubectl apply -f pv.yml
kubectl apply -f pvc.yml

kubectl create configmap configs-front --from-file=../applications/website/src/assets/configs/app-config.json -n training-app-frontend-prod

for file in  sealed-secrets-*.yml *-deployment.yml *-service.yml ingress.yml ; do
    kubectl apply -f $file
done



