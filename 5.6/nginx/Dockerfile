FROM dgoring/php:5.6-fpm

MAINTAINER David Goring

RUN sudo apt-get update \
 && sudo apt-get install -y --no-install-recommends \
    nginx

RUN sudo mkdir /var/client_body_temp

COPY etc/nginx/ /etc/nginx/
COPY etc/supervisor.d/nginx.ini /etc/supervisor.d/

COPY examples/nginx.conf /config
