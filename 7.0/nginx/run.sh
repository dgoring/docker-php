#!/bin/sh

# if commands are entered for crontab - check it
if [ -f /config/crontab ]; then
  crontab -u www-data /config/crontab
fi

exec supervisord --nodaemon --configuration="/etc/supervisord.conf" --loglevel=info
