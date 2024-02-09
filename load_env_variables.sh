#!/bin/sh

#load qr variables
echo 'QR_TMP_FOLDER="./generated_qr"' >> applications/qr/.env
echo 'QR_FILL_COLOR="#121128"' >> applications/qr/.env
echo 'QR_BACKGROUND_COLOR="#dcdbdb"' >> applications/qr/.env
echo 'USE_BUCKET=true' >> applications/qr/.env
echo "BUCKET_ACCESS_KEY=$PUBLIC_BUCKET_ACCESS_KEY" >> applications/qr/.env
echo "BUCKET_SECRET_KEY=$PUBLIC_BUCKET_SECRET_KEY" >> applications/qr/.env
echo 'BUCKET_NAME="test"' >> applications/qr/.env
echo 'BUCKET_PATH="test"' >> applications/qr/.env

#load backend variables
echo 'APP_PORT=3000' >> applications/backend/.env
echo 'QR_URL=http://qr:8000' >> applications/backend/.env
echo "MONGO_URI=$T007_MONGO_URL" >> applications/backend/.env
echo "MONGO_DB=test" >> applications/backend/.env