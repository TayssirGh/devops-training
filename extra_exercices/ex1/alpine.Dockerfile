FROM alpine:3.14

RUN apk  update && apk add --no-cache curl bash

COPY runner.sh /runner.sh
ENTRYPOINT /runner.sh