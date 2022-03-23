FROM php:7.4.27-fpm

LABEL maintainer="Paul Stewart"

# Install basic deps
RUN apt-get update && apt-get -y install \
    nginx supervisor gnupg git subversion zip wget letsencrypt

# Install GD
RUN apt-get update && apt-get -y install \
    libpng-dev zlib1g-dev \
    && docker-php-ext-install gd

# Install Imagemagick
RUN apt-get update && apt-get -y install \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# Install MySQLi
RUN docker-php-ext-install mysqli
