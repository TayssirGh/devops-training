#!/bin/sh

apt-get update
apt-get install openssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.decrypted.key -out localhost.crt -passin pass:$1 
openssl pkcs12 -export -out my-site.pfx -inkey localhost.decrypted.key -in localhost.crt
