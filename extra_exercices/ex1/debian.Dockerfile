FROM debian:latest

WORKDIR /exex
COPY runner.sh runnner.sh
RUN   apt-get update && apt-get install -y apt-cacher-ng

CMD ["bash"]