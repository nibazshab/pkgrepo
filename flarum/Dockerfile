FROM alpine

RUN apk add --no-cache \
    nginx \
    php \
    php-fpm \
    php-curl \
    php-dom \
    php-fileinfo \
    php-gd \
    php-json \
    php-mbstring \
    php-openssl \
    php-pdo_mysql \
    php-tokenizer \
    php-zip \
    php-opcache \
    php-session \
    composer \
    su-exec \
    s6 \
    php-exif

COPY rootfs /

RUN chmod +x /init /init.d/*/run /init.d/*/finish

VOLUME ["/data"]

WORKDIR /data/flarum
ENTRYPOINT ["/init"]
