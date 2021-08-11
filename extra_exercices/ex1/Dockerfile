FROM alpine:3.14

RUN apk update \
 && apk upgrade \
 && apk add --no-cache bash curl\
 && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY runner.sh /runner.sh
RUN chmod +x /runner.sh


ENTRYPOINT /entrypoint.sh