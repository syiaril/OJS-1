FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    nginx unzip git libzip-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev libicu-dev procps

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd intl bcmath ftp

RUN apt-get clean && rm -rf /var/lib/apt/lists/*


WORKDIR /var/www/html

COPY . /var/www/html


RUN mkdir -p files cache public \
    && chmod -R 777 files cache public


COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf


EXPOSE 80

CMD ["sh", "-c", "php-fpm -F & nginx -g 'daemon off;'"]
