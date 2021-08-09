if [[ ! -v SLEEP_DURATION ]]; then
    echo "SLEEP_DURATION is not set"
elif [[ -z "$SLEEP_DURATION" ]]; then
    echo "SLEEP_DURATION is set to the empty string"
else
    echo "SLEEP_DURATION has the value: $SLEEP_DURATION"
fi
if [[ ! -v WEBSITE_URL ]]; then
    echo "WEBSITE_URL is not set"
elif [[ -z "$WEBSITE_URL" ]]; then
    echo "WEBSITE_URL is set to the empty string"
else
    echo "WEBSITE_URL has the value: $WEBSITE_URL"
fi