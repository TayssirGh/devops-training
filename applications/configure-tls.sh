#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi
zypper refresh
zypper install openssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
