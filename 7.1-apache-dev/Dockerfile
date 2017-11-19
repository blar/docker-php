FROM foobox/php:7.1-apache
LABEL maintainer="gmblar+github@gmail.com"

ENV PHP_XDEBUG_REMOTE_PORT=9000
ENV PHP_XDEBUG_PROFILE_PATH=/tmp

COPY content /
RUN php-apache-dev-setup

ENTRYPOINT ["php-apache-dev-entrypoint"]
CMD ["httpd"]
