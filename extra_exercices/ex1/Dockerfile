FROM alpine:3.14

RUN apk update && apk add --no-cache curl bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY runner.sh /runner.sh
RUN chmod +x /runner.sh


ENTRYPOINT /entrypoint.sh