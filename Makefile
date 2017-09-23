all: php-7.1-cli php-7.1-dev php-7.1-fpm php-7.1-apache

php-7.1-common:
	docker build --no-cache --tag foobox/php:7.1-common 7.1-common

php-7.1-cli: php-7.1-common
	docker build --no-cache --tag foobox/php:7.1-cli 7.1-cli

php-7.1-cli-dev: php-7.1-cli
	docker build --no-cache --tag foobox/php:7.1-cli-dev 7.1-cli-dev

php-7.1-fpm: php-7.1-common
	docker build --no-cache --tag foobox/php:7.1-fpm 7.1-fpm

php-7.1-apache: php-7.1-common
	docker build --no-cache --tag foobox/php:7.1-apache 7.1-apache
