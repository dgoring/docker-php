#!/bin/sh

# if commands are entered for crontab - check it
if [ -f /config/crontab ]; then
  crontab -u www-data /config/crontab
fi

cat /etc/php.ini   > /usr/local/etc/php/php.ini
cat /config/*.ini >> /usr/local/etc/php/php.ini

exec supervisord --nodaemon --configuration="/etc/supervisord.conf" --loglevel=info
