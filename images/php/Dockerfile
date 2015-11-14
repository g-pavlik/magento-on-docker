FROM php:5.6-fpm
RUN apt-get update

# libicu needed for php-ext-intl
RUN apt-get install -y \
    php5-dev \
    libmcrypt-dev \
    libicu-dev \
    libpng12-dev \
    && docker-php-ext-install mysql gd mcrypt intl

RUN curl -L -o redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
    && mkdir -p /usr/src/redis \
    && tar -xvzf redis.tar.gz -C /usr/src/redis \
    && rm redis.tar.gz \
    && cd /usr/src/redis/phpredis-2.2.7/ \
    && phpize \
    && ./configure \
    && make \
    && make install

RUN yes "" | pecl install uopz

RUN docker-php-ext-install pdo_mysql

#CMD ["php-fpm"]
#EXPOSE 9000