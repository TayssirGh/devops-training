#!/bin/bash

#In this section, since I don't have a registered domain name to use in my letsencrypt configuration, I resorted to using a self signed SSL certificate using OpenSSL.

apt-get update
apt-get install -y openssl

# Generate a new private key and self-signed certificate valid for 365 days

mkdir -p ./nginx/certs

openssl req -x509 -out ./nginx/certs/localhost.crt -keyout ./nginx/certs/localhost.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <( \
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")

docker-compose --version

docker compose up -f docker-compose-D.yml 