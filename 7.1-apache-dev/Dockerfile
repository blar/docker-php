FROM foobox/php:7.1-apache
LABEL maintainer="gmblar+github@gmail.com"

ENV PHP_XDEBUG_REMOTE_HOST=localhost
ENV PHP_XDEBUG_REMOTE_PORT=9000

COPY content /
RUN php-apache-dev-setup

ENTRYPOINT ["php-apache-dev-entrypoint"]
CMD ["httpd"]
