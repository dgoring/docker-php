FROM dgoring/php:7.3-fpm

MAINTAINER David Goring

RUN sudo apt-get update --allow-releaseinfo-change \
 && sudo apt-get install -y --no-install-recommends \
    apache2 \
    libapache2-mod-xsendfile \
 && sudo a2enmod \
    rewrite \
    actions \
    proxy_fcgi \
    alias \
    ssl \
    xsendfile

COPY etc/apache2/ /etc/apache2/
COPY etc/supervisor.d/apache2.ini /etc/supervisor.d/

COPY examples/apache.conf /config/
