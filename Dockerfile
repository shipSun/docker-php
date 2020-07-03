FROM php:5.6-fpm
RUN dpkg-reconfigure -f noninteractive tzdata \
    && apt-get update && apt-get install -y \
          libfreetype6 \
          libfreetype6-dev \
          libjpeg62-turbo \
          libjpeg62-turbo-dev \
          libmcrypt-dev \
          libmcrypt4 \
          libpng-dev \
          zlib1g-dev \
          libcurl3-dev \
          curl \
          git \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/freetype2 \
        --with-png-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install  mysqli \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-install -j$(nproc)  mysql \
    && docker-php-ext-install bcmath \
    && rm -rf /var/lib/apt/list/* 









