FROM php:7.4-fpm

MAINTAINER David Goring

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    supervisor \
    libjpeg-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libreadline-dev \
    libmcrypt-dev \
    libssh2-1-dev \
    libtidy-dev \
    zziplib-bin \
    libxml2-dev \
    libonig-dev \
    libzip-dev \
    gnupg \
    msmtp \
    cron \
    git \
    zip \
    unzip \
    sudo \
    imagemagick \
    ghostscript \
    libmagickwand-dev

RUN yes | pecl install imagick xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN openssl req -new -newkey rsa:4096 -nodes -x509 -days 365 \
    -subj "/C=GB/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" \
    -keyout /etc/ssl/certs/server.key \
    -out    /etc/ssl/certs/server.crt

RUN docker-php-ext-configure gd --with-jpeg --with-freetype
RUN docker-php-ext-install \
    dom \
    exif \
    gd \
    iconv \
    mysqli \
    mbstring \
    pdo_mysql \
    tidy \
    zip

RUN cd /tmp \
    && git clone https://git.php.net/repository/pecl/networking/ssh2.git \
    && cd /tmp/ssh2/ \
    && .travis/build.sh \
 && docker-php-ext-enable \
    ssh2 \
    imagick

RUN curl -sS https://getcomposer.org/installer | php \
 && mv composer.phar /usr/bin/composer

RUN curl -skSL https://phar.phpunit.de/phpunit-8.4.phar -o /usr/bin/phpunit \
 && chmod +x /usr/bin/phpunit

RUN curl -sSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
        -o /usr/local/bin/wp \
  && chmod +x /usr/local/bin/wp

COPY etc/ /etc

COPY site/ /site
RUN mkdir /config

RUN chown -Rf www-data.www-data /site /config /var/www

RUN echo "www-data ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER www-data:www-data

# Copy main script
COPY run.sh /run.sh
RUN sudo chmod u+rwx /run.sh

EXPOSE 443

WORKDIR /site
ENTRYPOINT ["/run.sh"]
