FROM debian:12

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/Script.sh /usr/local/bin

RUN chmod +x /usr/local/bin/Script.sh

EXPOSE 443

CMD ["script.sh"]
