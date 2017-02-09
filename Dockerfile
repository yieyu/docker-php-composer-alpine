FROM alpine:latest

Maintainer yieyu <bashan-yeyu@foxmail.com>

ENV APK_REPOSITORY https://mirrors.tuna.tsinghua.edu.cn/alpine/edge
RUN echo -e "$APK_REPOSITORY/main\n$APK_REPOSITORY/community" >/etc/apk/repositories

RUN apk --update add libressl curl git && \
    apk add php7 \
            php7-curl \
            php7-ctype \
            php7-dom \
            php7-iconv \
            php7-json \
            php7-mbstring \
            php7-mcrypt \
            php7-opcache \
            php7-openssl \
            php7-pdo php7-pdo_mysql php7-pdo_sqlite \
            php7-phar \
            php7-session \
            php7-sockets \
            php7-zlib php7-zip && rm /var/cache/apk/*

# config php
RUN ln -s /usr/bin/php7 /usr/bin/php && \
    echo "date.timezone=${PHP_TIMEZONE:-UTC}" >/etc/php7/conf.d/date_timezone.ini
EXPOSE 8000

# install composer
ENV COMPOSER_HOME /home/.composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 


RUN mkdir -p /app

# Set up the volumes and working directory
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
CMD ["php", "-a"]
