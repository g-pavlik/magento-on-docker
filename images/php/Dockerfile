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
RUN yes "" | pecl install xdebug

RUN docker-php-ext-install pdo_mysql

# move this later up
RUN apt-get install -y git

RUN apt-get install -y nodejs npm

RUN npm install --global bower
RUN npm install --global 'coffee-script@1.8.0'


RUN apt-get install -y nodejs-legacy npm

#tmp - we should rather call docker from outside
RUN apt-get install -y mysql-client-5.5

RUN docker-php-ext-install zip

RUN apt-get install -y libxml2 libxml2-dev
RUN docker-php-ext-install soap

WORKDIR "/var/www/kinetic"

#CMD ["php-fpm"]
#EXPOSE 9000