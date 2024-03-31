FROM nginx:alpine

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Install envsubst, a tool from gettext package to substitute environment variables
RUN apk add --no-cache gettext

# Copy the custom configuration file template
COPY nginx.conf.template /etc/nginx/conf.d/nginx.conf.template

# Copy a script to substitute environment variables and run Nginx
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Volumes for SSL certificates
VOLUME ["/etc/ssl/certs", "/etc/ssl/private"]

EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
