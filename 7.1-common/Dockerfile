FROM foobox/common:latest
LABEL maintainer="andreas.treichel@twofour.de"
WORKDIR /var/www/html

ENV PHP_TIME_LIMIT=10
ENV PHP_MEMORY_LIMIT=64M

COPY content /
RUN php-common-setup
