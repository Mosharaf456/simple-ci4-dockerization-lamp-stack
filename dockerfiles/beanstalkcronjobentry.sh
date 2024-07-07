#!/bin/bash
set -e

# Start Beanstalkd service
beanstalkd -l 0.0.0.0 -p 11300 

cron -f 

# Start Apache in foreground
apache2-foreground

