#!/bin/bash
if [[ -z "$APP_PORT" ]]; then
  echo "The 'App_PORT' variable is required!"
  exit 1
fi
uvicorn app:atom --reload --host 0.0.0.0 --port "$APP_PORT"