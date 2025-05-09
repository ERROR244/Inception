#!/bin/bash

set -e

sleep 5

# Set correct ownership and permissions
chmod -R 755 /var/www/html
chown -R www-data:www-data /var/www/html

# Install WP-CLI if it's not already installed
if ! command -v wp &> /dev/null; then
  echo "Installing WP-CLI..."
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
fi


echo "Downloading WordPress..."
curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
tar -xzf /tmp/wordpress.tar.gz -C /tmp
cp -r /tmp/wordpress/* /var/www/html/
cp -r /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
rm -rf /tmp/wordpress /tmp/wordpress.tar.gz

sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" /var/www/html/wp-config.php
sed -i "s/username_here/${WORDPRESS_DB_USER}/"      /var/www/html/wp-config.php
sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/"  /var/www/html/wp-config.php
sed -i "s/localhost/${WORDPRESS_DB_HOST}/"          /var/www/html/wp-config.php

sed -i "s#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#" /etc/php/8.2/fpm/pool.d/www.conf

# Remove existing lines if they exist
sed -i "/WP_REDIS_HOST/d" /var/www/html/wp-config.php
sed -i "/WP_REDIS_PORT/d" /var/www/html/wp-config.php
sed -i "/WP_CACHE/d" /var/www/html/wp-config.php

# Insert fresh block
sed -i "/^\/\* That.*Happy publishing. \*\//i \
define('WP_REDIS_HOST', 'redis');\
\ndefine('WP_REDIS_PORT', 6379);\
\ndefine('WP_CACHE', true);\
" /var/www/html/wp-config.php



echo "Installing WordPress..."

wp core install \
    --path=${WP_PATH} \
    --url=${WP_URL} \
    --title=${WP_TITLE} \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASSWORD} \
    --admin_email=${WP_ADMIN_EMAIL} \
    --skip-email \
    --allow-root

# Install and activate Redis plugin
echo "Installing and activating Redis Object Cache plugin..."
wp plugin install redis-cache --activate --path=${WP_PATH} --allow-root

# Enable Redis object caching
echo "Enabling Redis object cache..."
wp redis enable --path=${WP_PATH} --allow-root

echo "Starting PHP-FPM with version: ${PHP_VERSION:-8.2}"
php-fpm${PHP_VERSION:-8.2} -F
