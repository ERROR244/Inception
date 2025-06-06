#!/bin/bash

sleep 3

# Generate a self-signed cert
mkdir -p /etc/nginx/certs
openssl req -x509 -nodes -days 365 \
            -subj "/C=MR/ST=StateName/L=benguerir/O=1337/OU=42/CN=localhost" \
            -newkey rsa:2048 \
            -keyout /etc/nginx/certs/selfsigned.key \
            -out /etc/nginx/certs/selfsigned.crt


nginx -g "daemon off;"