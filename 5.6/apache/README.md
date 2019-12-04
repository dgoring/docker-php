# php5.6-fpm + apache2
Docker image based on the image `php:5.6-fpm` with apache added on, this is for my personal use but if you have any suggestions please add an issue or create a pull request

## included packeges
### apache mods:
* xsendfile
* ssl
* rewrite

### php extentions:
* curl
* dom
* exif
* gd
* iconv
* mysql
* mysqli
* mbstring
* mcrypt
* pdo_mysql
* readline
* ssh2
* tidy
* zip

this package also includes Composer, crontab and supervisord
utilities

## Usage
```yaml
  web:
    image: dgoring/php:5.6-apache
    restart: always
    volumes:
      # 1. mount your workdir path
      - /site:/site
      # 2. mount your configuration files
      - /config:/config
```
optional config files

- *.conf for apache host config
- *.run for supervisord program
- *.fpm for php-fpm lister
- *.ini for php.ini file
- crontab for Cron settings

examples of which can be found in this repository

### note
This image has it's own fpm which runs on 127.0.0.1:9000
if you want to set your own you need to add the proxy in your host file
and set your fpm listener to a file or different port
```vhost
  <IFModule mod_proxy_fcgi.c>
  <FilesMatch "\.php\d?$">
      SetHandler  "proxy:fcgi://127.0.0.1:8000"
  </FilesMatch>
</IfModule>
```

### Extending
Note the default user is `www-data` so you need to prefix commands with `sudo` i.e.
```conf
RUN sudo apt-get install package-name
```
