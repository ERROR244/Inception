FROM debian:12

RUN apt-get update -y \
    && apt-get install \
    php${PHP_VERSION:-8.2}-fpm \
    php${PHP_VERSION:-8.2}-mysql \
    php${PHP_VERSION:-8.2}-cli \
    php${PHP_VERSION:-8.2}-curl \
    php${PHP_VERSION:-8.2}-gd \
    php${PHP_VERSION:-8.2}-mbstring \
    php${PHP_VERSION:-8.2}-xml \
    php${PHP_VERSION:-8.2}-zip \
    php-redis \
    net-tools \
    curl \
    wget \
    tini -y


COPY ./tools/Script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/Script.sh

EXPOSE 9000

CMD ["bash" , "/usr/local/bin/Script.sh"]