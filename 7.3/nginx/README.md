# php7.2-fpm + nginx
Docker image based on the image `php:7.2-fpm` with nginx added on, this is for my personal use but if you have any suggestions please add an issue or create a pull request

## included packeges
### php extentions:
* curl
* dom
* exif
* gd
* iconv
* mysqli
* mbstring
* pdo_mysql
* readline
* tidy
* zip

this package also includes Composer, crontab and supervisord
utilities

## Usage
```yaml
  web:
    image: dgoring/php:7.2-nginx
    restart: always
    volumes:
      # 1. mount your workdir path
      - /site:/site
      # 2. mount your configuration files
      - /config:/config
```
optional config files

- *.conf for nginx host config
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
location ~ \.php\d?$ {
    try_files $uri =404;

    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass 127.0.0.1:8000;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_param SCRIPT_NAME $fastcgi_script_name;
    fastcgi_index index.php;
    include fastcgi_params;
}

```
