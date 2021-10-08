# Copy of original PHP docker image in private Docker Registry
FROM php:8.0.10-fpm-buster AS php-base

RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y nano procps ca-certificates wget gnupg gnupg2 iputils-ping net-tools supervisor

#Install Composer: https://hub.docker.com/_/composer
COPY --from=localhost:5000/composer:latest /usr/bin/composer /usr/bin/composer

# This file contains the github-oauth access token (of course this file in not part of the repository)
COPY ./auth.json /var/www/.composer/auth.json

FROM php-base AS php-config

COPY scripts/ /scripts/

RUN chmod -R +x /scripts/ \
	&& /scripts/install.sh \
    && /scripts/permissions.sh

COPY ./config/php.ini "$PHP_INI_DIR/php.ini"

WORKDIR /var/www