FROM php:7.2-fpm

LABEL maintainer="Paul Stewart"

RUN apt-get update && apt-get -y install nginx supervisor gnupg git subversion zip wget

RUN docker-php-ext-install mysqli

RUN wget -P /bin https://dl.eff.org/certbot-auto && chmod a+x /bin/certbot-auto

RUN yes | certbot-auto --install-only