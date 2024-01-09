FROM php:8.1.22-apache

# Update and install Dependencies
RUN apt-get update \
  && apt-get install -y --quiet \
    cron \
    vim \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt1-dev \
    libzip-dev \
    libmagickwand-dev --no-install-recommends \
    ca-certificates \
    curl \
    git

# Configure Dependencies
RUN docker-php-ext-configure \
  gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/

# Install Dependencies
RUN docker-php-ext-install \
  bcmath \
  gd \
  intl \
  pdo \
  pdo_mysql \
  soap \
  xsl \
  opcache \
  zip \
  sockets
  
# Install Imagick extension
RUN pecl install imagick && docker-php-ext-enable imagick

# Install Dependencies
RUN a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer

# Install Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

COPY php.ini /usr/local/etc/php/
COPY magento-conf/env.php /usr/local/bin/

COPY start /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/start"]
CMD ["/usr/local/bin/start"]

USER www-data:www-data
WORKDIR /var/www/html