FROM php:5.6-fpm
RUN apt-get update
RUN apt-get install -y php5-dev
RUN curl -L -o redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz
RUN mkdir -p /usr/src/redis
RUN tar -xvzf redis.tar.gz -C /usr/src/redis
RUN rm redis.tar.gz
RUN cd /usr/src/redis/phpredis-2.2.7/ && phpize \
    && ./configure \
    && make \
    && make install
#\
#    && apt-get install -y php5-dev php5-redis \
#       php5-mysql php5-mcrypt php5-curl php5-gd php-pear
#RUN yes "" | pecl install uopz

CMD ["php-fpm"]
EXPOSE 9000