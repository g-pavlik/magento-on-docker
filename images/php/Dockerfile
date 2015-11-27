FROM php:5.5-fpm
RUN apt-get update

# lib* are mostly dependencies for required php extensions
RUN apt-get install -y \
    git \
    libmcrypt-dev \
    libpng12-dev \
    libicu-dev \
    libxml2 \
    libxml2-dev \
    nodejs \
    nodejs-legacy \
    npm \
    php5-dev \
    && docker-php-ext-install \
        bcmath \
        gd \
        intl \
        mcrypt \
        mysql \
        pdo_mysql \
        soap \
        zip

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
RUN yes "" | pecl install xdebug

RUN npm install --global bower
RUN npm install --global 'coffee-script@1.8.0'

RUN apt-get install -y mysql-client

WORKDIR "/var/www/kinetic"