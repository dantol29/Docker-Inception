# Use the official PHP image as the base image
FROM php:8.0-fpm

ARG DB_HOST
ARG DB_USER
ARG DB_NAME
ARG DB_PASSWORD
ARG WP_ADMIN_USER
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_EMAIL
ARG WP_TITLE
ARG WP_URL
ARG WP_GUEST_USER
ARG WP_GUEST_PASSWORD
ARG WP_GUEST_EMAIL

ENV DB_HOST=$DB_HOST
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_USER=$DB_USER
ENV DB_NAME=$DB_NAME
ENV WP_ADMIN_USER=$WP_ADMIN_USER
ENV WP_ADMIN_PASSWORD=$WP_ADMIN_PASSWORD
ENV WP_ADMIN_EMAIL=$WP_ADMIN_EMAIL
ENV WP_TITLE=$WP_TITLE
ENV WP_URL=$WP_URL
ENV WP_GUEST_USER=$WP_GUEST_USER
ENV WP_GUEST_PASSWORD=$WP_GUEST_PASSWORD
ENV WP_GUEST_EMAIL=$WP_GUEST_EMAIL

# Set the working directory
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y iputils-ping && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    wget \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mbstring mysqli pdo pdo_mysql tokenizer xml

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install the WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz \
    && cp -r wordpress/* /var/www/html/ \
    && rm -rf wordpress latest.tar.gz

# Set permissions
RUN chown -R www-data:www-data /var/www/html

RUN mkdir -p  /var/www/html/

RUN chmod 777 /var/www/html/

# COPY conf/settings.php /var/www/html/wp-config.php

# RUN chmod 777 /var/www/html/wp-config.php

COPY conf/conf.sh /usr/local/bin

RUN chmod 777 /usr/local/bin/conf.sh

ENTRYPOINT ["/usr/local/bin/conf.sh"]

# Expose port 9000
EXPOSE 9000

# Start PHP-FPM server
CMD ["php-fpm"]