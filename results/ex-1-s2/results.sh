#!/bin/bash
if [[ -z "$APP_PORT" ]]; then
  echo "The 'App_PORT' variable is required!"
  exit 1
else
  echo "The 'App_PORT' variable is empty"
  exit 0
fi
if [[ -n "$MONGO_URI" ]]; then
  echo "The 'MONGO_URI' variable is required!"
  exit 1
else
  echo "The 'MONGO_URI' variable is empty"
  exit 0
fi
if [[ -n "$MONGO_DB" ]]; then
  echo "The 'MONGO_DB' variable is required!"
  exit 1
else
  echo "The 'MONGO_DB' variable is empty"
  exit 0
fi
docker run --rm -p 8420:8420 --env-file qr.env mghodben/t001-qr
docker run --rm -p 3000:3000 --env-file backend.env mghodben/t001-backend
docker run --rm -p 85:85 --mount type=bind,source="$(pwd)/app-config.json",target="/app/assets/configs/app-config.json" mghodben/t001-website