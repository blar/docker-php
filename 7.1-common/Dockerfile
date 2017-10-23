FROM foobox/common:latest
LABEL maintainer="gmblar+github@gmail.com"
WORKDIR /var/www/html

ENV PHP_TIME_LIMIT=10
ENV PHP_MEMORY_LIMIT=64M
ENV PHP_POST_SIZE_LIMIT=8M
ENV PHP_UPLOAD_SIZE_LIMIT=8M

COPY content /
RUN php-common-setup
