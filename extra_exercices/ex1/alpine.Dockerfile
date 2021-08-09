FROM alpine:3.14

RUN apk  update && apk add --no-cache curl bash

ENV WEBSITE_URL=""
ENV SLEEP_DURATION=""

COPY runner.sh /runner.sh
ENTRYPOINT /runner.sh