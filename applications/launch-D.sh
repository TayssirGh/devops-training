#!/bin/bash
cat <<EOT >> ./applications/qr/.env
QR_TMP_FOLDER="./generated_qr"
QR_FILL_COLOR="#121128"
QR_BACKGROUND_COLOR="#dcdbdb"
USE_BUCKET=true
BUCKET_ENDPOINT="play.min.io:9000"
BUCKET_ACCESS_KEY="Q3AM3UQ867SPQQA43P2F"
BUCKET_SECRET_KEY="zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG"
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
docker-compose -f ./applications/docker-compose-D.yml up -d