#!/bin/bash
set -e

php -v

beanstalkd -l 0.0.0.0 -p 11300

cron -f

apache2-foreground

