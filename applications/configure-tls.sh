#!/bin/bash

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

if !command_exists openssl; then
    apt-get update
    apt-get install -y openssl
fi

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.decrypted.key -out /etc/ssl/certs/localhost.crt -passin pass:$1
