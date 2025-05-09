FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx php-fpm php-mysqli wget unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download Adminer
RUN mkdir -p /var/www/html && \
    wget -O /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

COPY tools/default.conf /etc/nginx/sites-available/default

EXPOSE 8800

# Run both services
CMD service php7.4-fpm start && nginx -g 'daemon off;'
