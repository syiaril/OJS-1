FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    nginx unzip git libzip-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev libicu-dev procps \
    && docker-php-ext-install mysqli pdo pdo_mysql zip gd intl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php

WORKDIR /var/www/html

# Copy OJS
COPY . /var/www/html

# Install vendor
RUN composer install --no-dev --optimize-autoloader

# Permission
RUN mkdir -p files cache public && chmod -R 777 files cache public

# Copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["sh", "-c", "php-fpm -F & nginx -g 'daemon off;'"]
