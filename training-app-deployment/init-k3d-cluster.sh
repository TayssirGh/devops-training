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

source seal-secrets.sh

kubectl apply -k base 

for file in  sealed-secrets-*.yml ; do
    kubectl apply -f $file
    # rm $file
done



