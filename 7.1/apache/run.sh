#!/bin/sh

# if commands are entered for crontab - check it
if [ -f /usr/local/config/crontab ]; then
  crontab -u www-data /usr/local/config/crontab
fi

exec supervisord --nodaemon --configuration="/etc/supervisord.conf" --loglevel=info
