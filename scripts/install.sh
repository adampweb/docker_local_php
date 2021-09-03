#!/bin/bash

apt-get update

# Install mysqli extension
    docker-php-ext-install mysqli


# Install Imagick
apt-get install -y libmagickwand-dev \
	&& pecl install imagick \
    && docker-php-ext-enable imagick

#Install xdebug
pecl install xdebug-3.0.4 \
    && docker-php-ext-enable xdebug      

#Install BZ2 extension
apt-get install -y libbz2-dev \
    && docker-php-ext-install bz2

#Install ZIP extension
apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    && docker-php-ext-install zip