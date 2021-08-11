#!/bin/bash

  if [[ -z "$WEBSITE_URL" ]]; then
     echo "The 'WEBSITE_URL' variable is required!"
     exit 1
  fi

  if [[ -z "$SLEEP_DURATION" ]]; then
    echo "The 'SLEEP_DURATION' variable is required!"
    exit 1
  fi
exec ./runner.sh
