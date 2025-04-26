FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

# Generate a self-signed cert
RUN mkdir -p /etc/nginx/certs && openssl req -x509 -nodes -days 365 \
                                 -subj "/C=MR/ST=StateName/L=benguerir/O=1337/OU=42/CN=localhost" \
                                 -newkey rsa:2048 \
                                 -keyout /etc/nginx/certs/server.key \
                                 -out /etc/nginx/certs/server.crt

RUN rm /etc/nginx/sites-enabled/default

COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
