FROM foobox/php:7.1-common
LABEL maintainer="andreas.treichel@twofour.de"
EXPOSE 9000

COPY content /
RUN php-fpm-setup

CMD ["php-fpm-entrypoint"]
