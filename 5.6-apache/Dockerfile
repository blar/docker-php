FROM foobox/php:5.6-common
LABEL maintainer="gmblar+github@gmail.com"
EXPOSE 80

COPY content /
RUN php-apache-setup

ENTRYPOINT ["php-apache-entrypoint"]
CMD ["httpd"]
