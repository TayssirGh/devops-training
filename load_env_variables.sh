#!/bin/sh

#load qr variables
set QR_TMP_FOLDER="./generated_qr"
set QR_FILL_COLOR="#121128"
set QR_BACKGROUND_COLOR="#dcdbdb"
set USE_BUCKET=true
set BUCKET_NAME="test"
set BUCKET_PATH="test"

#load backend variables
set APP_PORT=3000
set QR_URL="http://qr:8000"
set MONGO_DB=test