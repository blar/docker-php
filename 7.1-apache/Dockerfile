FROM foobox/php:7.1-common
LABEL maintainer="gmblar+github@gmail.com"

ONBUILD COPY . /var/www/html
ONBUILD RUN composer-extension-install

COPY content /
RUN php-apache-setup

ENTRYPOINT ["php-apache-entrypoint"]
CMD ["httpd"]
