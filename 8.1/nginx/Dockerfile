FROM dgoring/php:8.1-fpm

MAINTAINER David Goring

RUN sudo apt-get update --allow-releaseinfo-change \
 && sudo apt-get install -y --no-install-recommends \
    nginx

RUN sudo mkdir /var/client_body_temp

COPY etc/nginx/ /etc/nginx/
COPY etc/supervisor.d/nginx.ini /etc/supervisor.d/

COPY examples/nginx.conf /config

