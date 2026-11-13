FROM php:8.2-apache
RUN docker-php-ext-install pdo pdo_mysql && a2enmod rewrite
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf
COPY . /var/www/html
EXPOSE 80
