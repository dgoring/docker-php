#!/bin/sh

# if commands are entered for crontab - check it
if [ -f /config/crontab ]; then
  crontab /config/crontab
fi

sudo bash -c 'cat /etc/php.ini   > /usr/local/etc/php/php.ini'
sudo bash -c 'cat /config/*.ini >> /usr/local/etc/php/php.ini'

exec sudo supervisord --nodaemon --configuration="/etc/supervisord.conf" --loglevel=info
