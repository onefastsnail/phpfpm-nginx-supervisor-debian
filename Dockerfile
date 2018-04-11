FROM php:7.2-fpm

LABEL maintainer="Paul Stewart"

RUN apt-get update && apt-get -y install nginx supervisor gnupg

RUN docker-php-ext-install mysqli