FROM foobox/php:7.1-common
LABEL maintainer="gmblar+github@gmail.com"

COPY content /
RUN php-apache-setup

ENTRYPOINT ["php-apache-entrypoint"]
CMD ["httpd"]
