FROM foobox/php:7.1-cli
LABEL maintainer="gmblar+github@gmail.com"

COPY content /
RUN php-cli-dev-setup

ENTRYPOINT ["php-cli-dev-entrypoint"]

