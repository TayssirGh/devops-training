#!/bin/bash

if [[ -z "${WEBSITE_URL}" ]]; then
  echo "WEBSITE_URL is undefined, we will set it to google.com"
  export WEBSITE_URL="google.com"
else 
  echo "WEBSITE_URL is already set to ${WEBSITE_URL}"
fi

if [[ -z "${SLEEP_DURATION}" ]]; then
  echo "SLEEP_DURATION is undefined, we will set it to 10 seconds"
  export SLEEP_DURATION=10
else 
  echo "SLEEP_DURATION is already set to ${SLEEP_DURATION}"
fi

chmod +x runner.sh
./runner.sh