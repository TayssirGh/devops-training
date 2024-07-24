#!/bin/bash

if [[ -z "${WEBSITE_URL}" ]]; then
  echo "Error: WEBSITE_URL is not set."
  exit 1
fi

if [[ -z "${SLEEP_DURATION}" ]]; then
  echo "Error: SLEEP_DURATION is not set."
  exit 1
fi

exec /usr/local/bin/runner.sh
