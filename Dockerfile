# Gunakan image PHP-FPM resmi
FROM php:8.2-fpm

# Install dependencies OS
RUN apt-get update && apt-get install -y \
    nginx unzip git libzip-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev libicu-dev procps

# Install PHP extensions satu-satu biar jelas
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd intl bcmath ftp

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /var/www/html

# Copy source OJS ke container
COPY . /var/www/html

# Permission folder OJS
RUN mkdir -p files cache public \
    && chmod -R 777 files cache public

# Copy konfigurasi Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy dan set permission entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Hapus config.inc.php bawaan (akan di-generate oleh entrypoint)
RUN rm -f /var/www/html/config.inc.php

# Expose port 80
EXPOSE 80

# Jalankan entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh", "-c", "php-fpm -F & nginx -g 'daemon off;'"]
