#!bin/bash
MINIO_ENV_FILE="./applications/minio/.env"
QR_ENV_FILE="./applications/qr/.env"
BACKEND_ENV_FILE="./applications/backend/.env"
WEBSITE_CONFIG_FILE="./applications/website/src/assets/configs/app-config.json"

# Create the .env file for the Minio service
echo "MINIO_ROOT_USER=${T012_MINIO_ROOT_USER}" > "${MINIO_ENV_FILE}"
echo "MINIO_ROOT_PASSWORD=${T012_MINIO_ROOT_PASSWORD}" >> "${MINIO_ENV_FILE}"
echo "BUCKET_NAME=${T012_BUCKET_NAME}" >> "${MINIO_ENV_FILE}"
echo "SECRET_KEY=${T012_SECRET_KEY}" >> "${MINIO_ENV_FILE}"


# Create the .env file for the QR service

echo "QR_TMP_FOLDER=\"${T012_QR_TMP_FOLDER}\"" > "${QR_ENV_FILE}"
echo "QR_FILL_COLOR=\"${T012_QR_FILL_COLOR}\"" >> "${QR_ENV_FILE}"
echo "QR_BACKGROUND_COLOR=\"${T012_QR_BACKGROUND_COLOR}\"" >> "${QR_ENV_FILE}"
echo "USE_BUCKET=${T012_USE_BUCKET}" >> "${QR_ENV_FILE}"
echo "BUCKET_ENDPOINT=\"${T012_BUCKET_ENDPOINT}\"" >> "${QR_ENV_FILE}"
echo "BUCKET_ACCESS_KEY=\"${T012_BUCKET_ACCESS_KEY}\"" >> "${QR_ENV_FILE}"
echo "BUCKET_SECRET_KEY=\"${T012_BUCKET_SECRET_KEY}\"" >> "${QR_ENV_FILE}"
echo "BUCKET_NAME=\"${T012_BUCKET_NAME}\"" >> "${QR_ENV_FILE}"
echo "BUCKET_PATH=\"${T012_BUCKET_PATH}\"" >> "${QR_ENV_FILE}"


# Create the .env file for the Backend service
echo "APP_PORT=\"${T012_APP_PORT}\"" > "${BACKEND_ENV_FILE}"
echo "QR_URL=\"${T012_QR_URL}\"" > "${BACKEND_ENV_FILE}"
echo "MONGO_URI=\"${T012_MONGO_URI}\"" > "${BACKEND_ENV_FILE}"
echo "MONGO_DB=\"${T012_MONGO_DB}\"" > "${BACKEND_ENV_FILE}"


# Create the app-config.json file for the Website service
echo "{
    \"backendUrl\": \"${T012_BACKEND_URL}\",
    
}" > "${WEBSITE_CONFIG_FILE}"



docker compose -f ./applications/docker-compose-D.yml up -d