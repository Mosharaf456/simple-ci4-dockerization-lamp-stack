#!/bin/bash +x
set -e

echo "PHP Version:"
php -v
echo ""

echo "Composer Version:"
composer -v
echo ""

# Create necessary directories if they don't exist
mkdir -p /var/www/html/app/logs-cus
chown -R www-data:www-data /var/www/html/app/logs-cus
chmod -R 775 /var/www/html/app/logs-cus

echo "TEST sucessful" >> /var/www/html/app/logs-cus/log.php

# Start Apache in techo "This line will not be printed."
apache2-foreground


