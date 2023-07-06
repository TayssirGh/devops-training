#!bin/bash

sed -i "s|#T005_MONGO_URI#|${T005_MONGO_URI}|" training-app-deployment/k8s-secret-backend.yml
sed -i "s|#PUBLIC_BUCKET_ENDPOINT#|${PUBLIC_BUCKET_ENDPOINT}|" training-app-deployment/k8s-secret-qr.yml
sed -i "s|#PUBLIC_BUCKET_ACCESS_KEY#|${PUBLIC_BUCKET_ACCESS_KEY}|" training-app-deployment/k8s-secret-qr.yml
sed -i "s|#PUBLIC_BUCKET_SECRET_KEY#|${PUBLIC_BUCKET_SECRET_KEY}|" training-app-deployment/k8s-secret-qr.yml