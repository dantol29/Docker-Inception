# Use the official PHP image as the base image
FROM php:8.0-fpm

# Set the working directory
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
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

# Expose port 9000 and 3306
EXPOSE 9000 3306

# Start PHP-FPM server
CMD ["php-fpm"]