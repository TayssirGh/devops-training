#!/bin/sh

apt-get update
apt-get install openssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout my-site.key -out my-site.crt -config ./nginx/my-site.conf -passin pass:$CERT_PASS
openssl pkcs12 -export -out ./nginx/my-site.pfx -inkey ./nginx/my-site.key -in my-site.crt