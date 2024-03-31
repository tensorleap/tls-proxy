#!/bin/sh

# Immediately exit on error
set -e

echo "Starting Nginx with the following configuration:"
echo "Domain: $DOMAIN"
echo "Port: $PORT"

# Use environment variables to set up dynamic values
# envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf
envsubst < /etc/nginx/conf.d/nginx.conf

# Output the resulting configuration for debugging
# cat /etc/nginx/conf.d/default.conf

# Start Nginx in the foreground
exec nginx -g 'daemon off;'