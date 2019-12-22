FROM php:7.4.0-fpm

RUN apt-get update && \
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git zip libzip-dev zlib1g-dev && \
    apt-get install --no-install-recommends --assume-yes --quiet libxrender1 libfontconfig1 libx11-dev libjpeg62 libxtst6 libpq-dev  && \
    docker-php-ext-configure zip --with-libzip && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install zip mysqli pdo pdo_mysql pdo_pgsql opcache && \
    rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug && \
    pecl install mongodb && \
    docker-php-ext-enable xdebug

RUN echo 'xdebug.remote_host=docker.for.mac.host.internal' >> /usr/local/etc/php/php.ini && \
    echo 'xdebug.remote_port=9002' >> /usr/local/etc/php/php.ini && \
    echo 'xdebug.remote_connect_back=0' >> /usr/local/etc/php/php.ini && \
    echo 'xdebug.idekey=PHPSTORM' >> /usr/local/etc/php/php.ini && \
    echo 'xdebug.remote_autostart=1' >> /usr/local/etc/php/php.ini && \
    echo 'xdebug.default_enable=1' >> /usr/local/etc/php/php.ini && \
    echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/php.ini && \
    echo 'xdebug.remote_handler=dbgp' >> /usr/local/etc/php/php.ini && \
    echo 'xdebug.remote_log=/app/var/log/xdebug.log' >> /usr/local/etc/php/php.ini && \
    echo 'extension=mongodb.so' >> /usr/local/etc/php/php.ini && \
    echo 'memory_limit=-1' >> /usr/local/etc/php/php.ini && \
    echo 'date.timezone = "Europe/Warsaw"' >> /usr/local/etc/php/php.ini
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

RUN composer global require hirak/prestissimo --prefer-dist

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

WORKDIR /app

RUN chown 1000:1000 -R /app

USER 1000

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm"]
