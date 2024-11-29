# Use the official PHP FPM image, specifically version 7.4
FROM php:7.4-fpm

# instalar librerías que puedan requerir ssl, encriptación y uso de archivos.
RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libonig-dev \
    libzip-dev \
    libbz2-dev \
    libxml2-dev \
    libc-client-dev \
    libkrb5-dev \
    libpspell-dev \
    libxslt1-dev \
    libicu-dev \
    libssl-dev \
    libsqlite3-dev \
    vim \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Configurar la zona horaria
ENV TZ=America/Santiago
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Extensiones PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) mysqli gd mbstring zip bcmath bz2 calendar exif gettext intl pcntl pspell soap sockets pdo_mysql pdo_sqlite

# Instalamos mcrypt
RUN pecl install mcrypt-1.0.7 && docker-php-ext-enable mcrypt
# Configurar permisos (ajusta 'www-data' si es necesario)
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

# Copiar la aplicación al contenedor y ajustar permisos
COPY --chown=www-data:www-data ./app /var/www/html
RUN find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \;

# PHP Configuraciones
COPY php.ini /usr/local/etc/php/conf.d/custom.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

EXPOSE 9000
CMD ["php-fpm"]