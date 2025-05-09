FROM debian:12

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

COPY ./tools/default.conf       /etc/nginx/conf.d/default.conf
COPY ./tools/index.html         /usr/share/nginx/html/index.html
COPY ./tools/style.css          /usr/share/nginx/html/style.css


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
