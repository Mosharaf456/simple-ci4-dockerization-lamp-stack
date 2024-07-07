#!/bin/bash
set -e

# Start Beanstalkd service
beanstalkd -l 0.0.0.0 -p 11300 

# Start Apache in foreground
apache2-foreground

