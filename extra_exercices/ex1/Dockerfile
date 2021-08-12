FROM alpine:3.14
WORKDIR  /alpine
RUN apk update && apk add --no-cache bash &&  apk --no-cache add curl
#add entrypoint to container to validate environment variables
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
#add permission to runner.sh to be executed under the container
USER  root
COPY runner.sh runner.sh
RUN chmod +x runner.sh
#Call entrypoint.sh
ENTRYPOINT /entrypoint.sh