#!bin/bash

sed -i "s|#T005_MONGO_URI#|${T005_MONGO_URI}|" k8s-secret-backend.yml
sed -i "s|#PUBLIC_BUCKET_ENDPOINT#|${PUBLIC_BUCKET_ENDPOINT}|" k8s-secret-qr.yml
sed -i "s|#PUBLIC_BUCKET_ACCESS_KEY#|${PUBLIC_BUCKET_ACCESS_KEY}|" k8s-secret-qr.yml
sed -i "s|#PUBLIC_BUCKET_SECRET_KEY#|${PUBLIC_BUCKET_SECRET_KEY}|" k8s-secret-qr.yml