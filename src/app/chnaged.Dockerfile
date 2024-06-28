# Install necessary packages and configure PHP
FROM php:8.1.0-apache

RUN apt-get update \
    && apt-get install -y nano zip unzip git libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Enable Apache modules
RUN a2enmod rewrite

# Set working directory and copy application files
WORKDIR /var/www/html
COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html \
    && composer self-update
# Copy Apache virtual host configuration
COPY codeigniter.conf /etc/apache2/sites-available/
RUN chmod 644 /etc/apache2/sites-available/codeigniter.conf

# Set ServerName to avoid warnings
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Enable the site
RUN a2ensite codeigniter.conf

# Start Apache to check if it starts correctly
RUN service apache2 start || (cat /var/log/apache2/error.log && false)

RUN service apache2 status || (cat /var/log/apache2/error.log && false)


# Reload Apache
RUN service apache2 reload || (cat /var/log/apache2/error.log && false)

# Disable default site (if needed)
RUN a2dissite 000-default.conf

# Reload Apache again to apply changes
RUN service apache2 reload || (cat /var/log/apache2/error.log && false)

# Expose port 80
EXPOSE 80
