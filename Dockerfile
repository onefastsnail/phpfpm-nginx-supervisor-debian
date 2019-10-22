FROM php:7.2-fpm

LABEL maintainer="Paul Stewart"

# Install basic deps
RUN apt-get update && apt-get -y install \
    nginx supervisor gnupg git subversion zip wget

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

# Install Certbot
RUN wget -P /bin https://dl.eff.org/certbot-auto && chmod a+x /bin/certbot-auto
RUN yes | certbot-auto --install-only