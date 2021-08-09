FROM alpine:3.14
USER root
COPY ./runner.sh runner.sh
RUN apk update && apk add --no-cache bash &&  apk --no-cache add curl
RUN chmod +x ./runner.sh
ENTRYPOINT /runner.sh