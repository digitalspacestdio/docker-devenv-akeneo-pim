#!/bin/bash
set -e

echo "[$(date +'%F %T')] ==> Restoring shared folders ownership"
sudo mkdir -p /var/www/public/{cache}
sudo mkdir -p /var/www/var/{logs,cache,file_storage}
sudo chown -R www-data:www-data /var/www/public/{cache}
sudo chown -R www-data:www-data /var/www/var/{logs,cache,file_storage}

echo "[$(date +'%F %T')] ==> Clearing the cache"
NO_DOCKER=true make cache

cd /var/www
sudo mkdir -p /var/www/.composer
sudo chmod 0777 /var/www/.composer

echo "[$(date +'%F %T')] ==> Installing vendors"
composer-1.10 install --optimize-autoloader --no-progress --no-dev --no-interaction
find . -depth -name ".git" -print -exec rm -rf "{}" \;

echo "[$(date +'%F %T')] ==> Verify Installation"
bin/console pim:installer:check-requirements

echo "[$(date +'%F %T')] ==> Clearing the cache"
NO_DOCKER=true make cache

echo "[$(date +'%F %T')] ==> Build frontend"
NO_DOCKER=true make upgrade-front

echo "[$(date +'%F %T')] ==> Apply migration"
bin/console doctrine:migrations:migrate

cd /var/www
exec /home/linuxbrew/.linuxbrew/opt/php72/sbin/php-fpm --nodaemonize --fpm-config /home/linuxbrew/.linuxbrew/etc/php/7.2/php-fpm.conf