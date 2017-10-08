FROM foobox/php:7.1-common
LABEL maintainer="gmblar+github@gmail.com"
EXPOSE 80

COPY content /
RUN php-apache-setup

ENTRYPOINT ["php-apache-entrypoint"]
CMD ["httpd"]
