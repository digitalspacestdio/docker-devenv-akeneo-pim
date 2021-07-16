#!/bin/bash
set -e

echo "[$(date +'%F %T')] ==> Creating cache dirs"
#mkdir -p /var/www/public/{cache}
#mkdir -p /var/www/var/{logs,cache,file_storage}

cd /var/www
mkdir -p /var/www/.composer
chmod 0777 /var/www/.composer

#echo "[$(date +'%F %T')] ==> Clearing the cache"
#NO_DOCKER=true make cache
#
#echo "[$(date +'%F %T')] ==> Installing vendors"
#composer-1.10 install --optimize-autoloader --no-progress --no-dev --no-interaction
#find . -depth -name ".git" -print -exec rm -rf "{}" \;
#
#echo "[$(date +'%F %T')] ==> Verify Installation"
#bin/console pim:installer:check-requirements
#
#echo "[$(date +'%F %T')] ==> Clearing the cache"
#NO_DOCKER=true make cache
#
#echo "[$(date +'%F %T')] ==> Build frontend"
#NO_DOCKER=true make upgrade-front
#
#echo "[$(date +'%F %T')] ==> Apply migration"
#bin/console doctrine:migrations:migrate
#
#cd /var/www
exec /home/linuxbrew/.linuxbrew/opt/php74/sbin/php-fpm --nodaemonize --fpm-config /home/linuxbrew/.linuxbrew/etc/php/7.4/php-fpm.conf