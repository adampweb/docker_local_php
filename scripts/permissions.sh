#!/bin/bash 

USER_ID=1000
GROUP_ID=1000


userdel -f www-data \
    && if getent group www-data ; then groupdel -f www-data; fi \
    && groupadd -f -g "${GROUP_ID}" www-data \
    && useradd -l -u "${USER_ID}" -g "${GROUP_ID}" -d /var/www www-data \
    && chown -R "${USER_ID}":"${GROUP_ID}" /var/www

exec "$@"