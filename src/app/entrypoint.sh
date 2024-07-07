#!/bin/bash +x
set -e

php -v
# Create necessary directories if they don't exist
mkdir -p /var/www/html/app/logs-cus
chown -R www-data:www-data /var/www/html/app/logs-cus
chmod -R 755 /var/www/html/app/logs-cus

# echo "TEST sucessful" >> /var/www/html/app/logs-cus/log.php

# Start Apache in techo "This line will not be printed."

# beanstalkd -l 0.0.0.0 -p 11300 &
# beanstalkd -l 127.0.0.1 -p 11345 

beanstalkd -l 0.0.0.0 -p 11300

cron -f

apache2-foreground






