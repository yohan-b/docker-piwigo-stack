#!/bin/bash
unset VERSION_APACHE_FPM
unset VERSION_PHP_FPM
unset VERSION_PHP_FPM_PIWIGO

export VERSION_APACHE_FPM=$(git ls-remote ssh://git@git.scimetis.net:2222/yohan/docker-apache-for-fpm.git| head -1 | cut -f 1|cut -c -10)
export VERSION_PHP_FPM=$(git ls-remote ssh://git@git.scimetis.net:2222/yohan/docker-php7-fpm.git| head -1 | cut -f 1|cut -c -10)
export VERSION_PHP_FPM_PIWIGO=$(git ls-remote ssh://git@git.scimetis.net:2222/yohan/docker-php-fpm-piwigo.git| head -1 | cut -f 1|cut -c -10)

sudo -E bash -c 'docker build -t php7-fpm:latest "https://git.scimetis.net/yohan/docker-php7-fpm.git"' \
&& sudo -E bash -c 'docker-compose up -d --build --force-recreate'
