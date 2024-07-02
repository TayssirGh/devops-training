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
docker container prune
docker volume prune
docker-compose -f ./applications/docker-compose-D.yml up