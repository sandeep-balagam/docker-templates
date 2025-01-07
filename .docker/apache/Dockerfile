# Replace with required version
FROM php:8.2-apache

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
    libwebp-dev \
    ca-certificates \
    curl \
    git \
    nano

# Configure Dependencies
RUN docker-php-ext-configure \
  gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ --with-webp=/usr/include/

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

# Enable Apache Modules
RUN a2enmod rewrite ssl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer

# Install Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

COPY apache/php.ini /usr/local/etc/php/
COPY apache/magento-conf/env.php /usr/local/bin/

# Add Permissions for cron as www-data user
RUN chmod u+s /usr/sbin/cron
RUN usermod -s /bin/bash www-data

# Add Composer Cache
RUN mkdir /var/www/.composer
RUN chown www-data:www-data /var/www/.composer

# Install SSL and enable
COPY ssl/ /usr/local/share/ca-certificates/
COPY ssl/docker.crt /etc/ssl/certs/ssl-cert-snakeoil.pem
COPY ssl/docker.key /etc/ssl/private/ssl-cert-snakeoil.key
RUN chmod 644 /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/ssl/private/ssl-cert-snakeoil.key
RUN chmod 755 /etc/ssl/private
RUN update-ca-certificates
RUN a2ensite default-ssl

COPY apache/start /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/start"]
CMD ["/usr/local/bin/start"]

USER www-data:www-data
WORKDIR /var/www/html