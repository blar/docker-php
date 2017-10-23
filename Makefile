all: php-7.1-cli php-7.1-cli-dev php-7.1-fpm php-7.1-apache php-7.1-apache-dev

php-7.1-common:
	docker build --tag foobox/php:7.1-common 7.1-common

php-7.1-cli: php-7.1-common
	docker build --tag foobox/php:7.1-cli 7.1-cli

php-7.1-cli-dev: php-7.1-cli
	docker build --tag foobox/php:7.1-cli-dev 7.1-cli-dev

php-7.1-fpm: php-7.1-common
	docker build --tag foobox/php:7.1-fpm 7.1-fpm

php-7.1-apache: php-7.1-common
	docker build --tag foobox/php:7.1-apache 7.1-apache

php-7.1-apache-dev: php-7.1-apache
	docker build --tag foobox/php:7.1-apache-dev 7.1-apache-dev
