FROM foobox/php:7.1-common
LABEL maintainer="gmblar+github@gmail.com"
EXPOSE 9000

COPY content /
RUN php-fpm-setup

CMD ["php-fpm-entrypoint"]
