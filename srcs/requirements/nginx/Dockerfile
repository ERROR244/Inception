FROM debian:12

RUN apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

COPY ./tools/Script.sh          /usr/local/bin/
COPY ./tools/default.conf       /etc/nginx/conf.d/default.conf

RUN chmod +x /usr/local/bin/Script.sh

EXPOSE 443

CMD ["bash", "/usr/local/bin/Script.sh"]
