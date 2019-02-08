FROM php:7.3-fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
	libzip-dev \
    libicu-dev \
    libmcrypt-dev \
    libpng-dev \
    libxml2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    cron \
    sendmail \
    supervisor

RUN docker-php-ext-install \
    intl \
    mbstring \
    opcache \
    pdo \
    pdo_mysql \
    soap \
    exif \
    iconv \
    mysqli \
    zip

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip

ARG APP_ENV=dev
RUN printf "\033[0;36m===> \033[0;33m\$APP_ENV=$APP_ENV\033[0m\n"

RUN if [ "${APP_ENV}" = "dev" ];\
    then pecl install xdebug-2.7.0RC1 && docker-php-ext-enable xdebug;\
    else echo "skipped";\
  fi

RUN pecl install \
  apcu

RUN docker-php-ext-enable \
  apcu

RUN rm -rf /var/lib/apt/lists/*

COPY ./php.ini /usr/local/etc/php/

VOLUME /var/www/html
WORKDIR /var/www/html

RUN curl -s -f -L -o /tmp/composer-setup.php https://getcomposer.org/installer \
 && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/bin --filename=composer \
 && composer --ansi --version --no-interaction \
 && rm -rf /tmp/* /tmp/.htaccess

COPY ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["entrypoint.sh"]