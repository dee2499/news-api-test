FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www/html/

WORKDIR /var/www/html

RUN composer install --no-dev --optimize-autoloader

RUN chown -R www-data:www-data /var/www/html

RUN echo 'DocumentRoot /var/www/html/public' >> /etc/apache2/apache2.conf \
    && echo '<Directory /var/www/html/public>' >> /etc/apache2/apache2.conf \
    && echo '    Options Indexes FollowSymLinks' >> /etc/apache2/apache2.conf \
    && echo '    AllowOverride All' >> /etc/apache2/apache2.conf \
    && echo '    Require all granted' >> /etc/apache2/apache2.conf \
    && echo '</Directory>' >> /etc/apache2/apache2.conf \
    && a2enmod rewrite

RUN echo 'DirectoryIndex index.php index.html' > /etc/apache2/conf-available/custom.conf \
    && a2enconf custom

WORKDIR /var/www/html/public

EXPOSE 80

CMD ["apache2-foreground"]
