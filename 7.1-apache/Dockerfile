FROM foobox/php:7.1-common
LABEL maintainer="andreas.treichel@twofour.de"

COPY content /
RUN php-apache-setup

ENTRYPOINT ["php-apache-entrypoint"]
CMD ["httpd"]
