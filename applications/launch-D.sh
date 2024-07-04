#!/bin/bash
PUBLIC_BUCKET_ACCESS_KEY=$1
PUBLIC_BUCKET_ENDPOINT=$2
PUBLIC_BUCKET_SECRET_KEY=$3

cat <<EOT >> ./applications/qr/.env
QR_TMP_FOLDER="./generated_qr"
QR_FILL_COLOR="#121128"
QR_BACKGROUND_COLOR="#dcdbdb"
USE_BUCKET=true
BUCKET_ENDPOINT="$PUBLIC_BUCKET_ENDPOINT"
BUCKET_ACCESS_KEY="$PUBLIC_BUCKET_ACCESS_KEY"
BUCKET_SECRET_KEY="$PUBLIC_BUCKET_SECRET_KEY"
BUCKET_NAME="test"
BUCKET_PATH=""
EOT
cat <<EOF > ./applications/nginx.conf
upstream website {
    server applications-website-1:80;
    server applications-website-2:80;
}

upstream backend {
    server applications-backend-1:3000;
    server applications-backend-2:3000;
}

upstream qr {
    server applications-qr-1:8420;
    server applications-qr-2:8420;
}

server {
    listen 80;
    server_name localhost;

    return 301 https://\$host\$request_uri;
}

server {
    listen 443 ssl;
    server_name localhost;
    ssl_certificate /etc/nginx/ssl/certificate.crt;
    ssl_certificate_key /etc/nginx/ssl/private.key;

    location / {
        proxy_pass http://website;
    }
    location /backend/access {
        proxy_pass http://backend/access;
    }
    location /qr {
        proxy_pass http://qr/;
    }
}
EOF
cat <<EOF > ./applications/website/src/assets/configs/app-config.json
{
  "backendUrl": "https://localhost/backend/access"
}

EOF
docker-compose -f ./applications/docker-compose-D.yml up -d