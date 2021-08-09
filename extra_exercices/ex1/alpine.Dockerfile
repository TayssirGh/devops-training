FROM alpine:3.14

RUN apk add --no-cache mysql-client

ENV WEBSITE_URL=""
ENV SLEEP_DURATION=""

ENTRYPOINT ["mysql"]