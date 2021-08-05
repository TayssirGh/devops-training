#!/bin/bash

LAST_DETECTED_DOWNTIME="none"

run_uptime() {
  status_code="$(curl -w '%{http_code}' -s -o /dev/null -L "${WEBSITE_URL}")"

  if [[ "$status_code" != "200" ]]; then
    if [[ "$LAST_DETECTED_DOWNTIME" == "none" ]]; then
      LAST_DETECTED_DOWNTIME="$(date '+%x %X %Z')"
      echo "/!\ ${WEBSITE_URL} is down!"
      echo -e "Downtime detected at '${LAST_DETECTED_DOWNTIME}' \nError code : '$status_code'"
    fi
  else
    if [[ "$LAST_DETECTED_DOWNTIME" != "none" ]]; then
      echo "${WEBSITE_URL} is up!"
      echo -e "Downtime detected at '${LAST_DETECTED_DOWNTIME}' \nUptime detected at '$(date '+%x %X %Z')'"
      LAST_DETECTED_DOWNTIME="none"
    fi
  fi
}

while true; do
  echo "[$(date '+%x %X %Z')] Attempting to ping ${WEBSITE_URL}"
  run_uptime
  sleep "$SLEEP_DURATION"
done
