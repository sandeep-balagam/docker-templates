# Adjust PHP version as required
FROM php:8.2-fpm-alpine

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Install system dependencies
RUN apk update && apk add \
    bash \
    git \
    curl \
    libpng-dev \
    libxml2-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    freetype-dev \
    icu-dev \
    oniguruma-dev \
    zip \
    unzip \
    openssl \
    ca-certificates \
    shadow \
    gnu-libiconv \
    mysql-client \
    nodejs \
    npm \
    libxslt-dev \
    libzip-dev

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install \
    bcmath \
    intl \
    gd \
    mysqli \
    pdo_mysql \
    soap \
    xsl \
    opcache \
    sockets \
    zip

# Install and enable PHP extensions via PECL
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS && \
    pecl install redis && \
    docker-php-ext-enable redis && \
    apk del .build-deps

# Increase PHP memory limit and set recommended PHP configurations for Magento
RUN echo "memory_limit=2G" > /usr/local/etc/php/conf.d/memory-limit.ini && \
    echo "upload_max_filesize=20M" > /usr/local/etc/php/conf.d/uploads.ini && \
    echo "post_max_size=20M" > /usr/local/etc/php/conf.d/post.ini && \
    echo "max_execution_time=300" > /usr/local/etc/php/conf.d/execution-time.ini && \
    echo "max_input_vars=8000" > /usr/local/etc/php/conf.d/max_input_vars.ini

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN adduser -D -u $uid -g 'www-data' $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Install SSL
COPY ssl/ /usr/local/share/ca-certificates/
RUN update-ca-certificates

# Set working directory
WORKDIR /var/www

USER $user