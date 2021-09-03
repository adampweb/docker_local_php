# Copy of original PHP docker image in private Docker Registry
FROM localhost:5000/php:8.0.10-fpm-buster

#Install Composer: https://hub.docker.com/_/composer
COPY --from=localhost:5000/composer:latest /usr/bin/composer /usr/bin/composer

COPY scripts/ /scripts/

RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y nano procps ca-certificates wget gnupg gnupg2 iputils-ping net-tools supervisor \
    && chmod -R +x /scripts/ \
	&& /scripts/install.sh \
    && /scripts/permissions.sh

# This file contains the github-oauth access token (of course this file in not part of the repository)
COPY ./auth.json /var/www/.composer/auth.json

COPY ./config/php.ini "$PHP_INI_DIR/php.ini"

WORKDIR /var/www

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]