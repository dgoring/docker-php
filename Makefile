build/version: build/5.6-apache build/5.6-nginx build/7.0-apache build/7.0-nginx build/7.1-apache build/7.1-nginx build/7.2-apache build/7.2-nginx build/7.3-apache build/7.3-nginx
	date > build/version

loggedin:
ifneq ($(grep -q "\"auth\"" ~/.docker/config.json),)
	@echo Please Login to Docker
	@exit 1
endif
ifneq ($(docker-machine active),)
	docker-machine start
endif

build/5.6-fpm: 5.6/fpm
	@make loggedin
	docker image build -t dgoring/php:5.6-fpm ./5.6/fpm
	@date > ./build/5.6-fpm

build/5.6-apache: 5.6/apache build/5.6-fpm
	@make loggedin
	docker image build -t dgoring/php:5.6-apache ./5.6/apache
	docker push dgoring/php:5.6-apache
	@date > ./build/5.6-apache

build/5.6-nginx: 5.6/nginx build/5.6-fpm
	@make loggedin
	docker image build -t dgoring/php:5.6-nginx ./5.6/nginx
	docker push dgoring/php:5.6-nginx
	@date > ./build/5.6-nginx


build/7.0-fpm: 7.0/fpm
	@make loggedin
	docker image build -t dgoring/php:7.0-fpm ./7.0/fpm
	@date > ./build/7.0-fpm

build/7.0-apache: 7.0/ build/7.0-fpm
	@make loggedin
	docker image build -t dgoring/php:7.0-apache ./7.0/apache
	docker push dgoring/php:7.0-apache
	@date > ./build/7.0-apache

build/7.0-nginx: 7.0/nginx build/7.0-fpm
	@make loggedin
	docker image build -t dgoring/php:7.0-nginx ./7.0/nginx
	docker push dgoring/php:7.0-nginx
	@date > ./build/7.0-nginx


build/7.1-fpm: 7.1/fpm
	@make loggedin
	docker image build -t dgoring/php:7.1-fpm ./7.1/fpm
	@date > ./build/7.1-fpm

build/7.1-apache: 7.1/apache build/7.1-fpm
	@make loggedin
	docker image build -t dgoring/php:7.1-apache ./7.1/apache
	docker push dgoring/php:7.1-apache
	@date > ./build/7.1-apache

build/7.1-nginx: 7.1/nginx build/7.1-fpm
	@make loggedin
	docker image build -t dgoring/php:7.1-nginx ./7.1/nginx
	docker push dgoring/php:7.1-nginx
	@date > ./build/7.1-nginx


build/7.2-fpm: 7.2/fpm
	@make loggedin
	docker image build -t dgoring/php:7.2-fpm ./7.2/fpm
	@date > ./build/7.2-fpm

build/7.2-apache: 7.2/apache build/7.2-fpm
	@make loggedin
	docker image build -t dgoring/php:7.2-apache ./7.2/apache
	docker push dgoring/php:7.2-apache
	@date > ./build/7.2-apache

build/7.2-nginx: 7.2/nginx build/7.2-fpm
	@make loggedin
	docker image build -t dgoring/php:7.2-nginx ./7.2/nginx
	docker push dgoring/php:7.2-nginx
	@date > ./build/7.2-nginx

build/7.3-fpm: 7.3/fpm
	@make loggedin
	docker image build -t dgoring/php:7.3-fpm ./7.3/fpm
	@date > ./build/7.3-fpm

build/7.3-apache: 7.3/apache build/7.3-fpm
	@make loggedin
	docker image build -t dgoring/php:7.3-apache ./7.3/apache
	docker push dgoring/php:7.3-apache
	@date > ./build/7.3-apache

build/7.3-nginx: 7.3/nginx build/7.3-fpm
	@make loggedin
	docker image build -t dgoring/php:7.3-nginx ./7.3/nginx
	docker push dgoring/php:7.3-nginx
	@date > ./build/7.3-nginx

