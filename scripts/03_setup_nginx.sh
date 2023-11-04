#! /bin/bash

# The script configures and launches a web server,
# linking it to the specified web directory, sets necessary permissions,
# assigns ownership to the user who initiated the script, and
# enables auto-start when the system boots.

# Use:          sudo ./02_setup_nginx.sh <domain_name> <path_to_site>
# Example 1:    sudo ./02_setup_nginx.sh example.com ../PathToSite/ 

ME=`basename "$0"`
DOMAIN_NAME=$1
PATH_TO_SITE=$2

# Print hello
echo "Script $ME started!"

# Install nginx
apt update && apt install nginx

# Remove default site
rm /etc/nginx/sites-enabled/default

# Back up the default nginx.conf
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bck

# Copy nginx config
cp ../configs/nginx.conf /etc/nginx/nginx.conf

# Test nginx config
nginx -t

# Reload nginx
systemctl reload nginx

# Create folders
mkdir -p /var/www/$DOMAIN_NAME/html

# Apply appropriate permissions
chown -R $USER:$USER /var/www/$DOMAIN_NAME/html
chmod -R 755 /var/www

# Copy files
cp -r $PATH_TO_SITE/. /var/www/$DOMAIN_NAME/html/

# Copy site config
cp ../configs/$DOMAIN_NAME.conf /etc/nginx/sites-available/$DOMAIN_NAME

# Enable site
ln -s /etc/nginx/sites-available/$DOMAIN_NAME /etc/nginx/sites-enabled/

# Test site config
nginx -t

# Reload nginx
systemctl reload nginx

# Get nginx status
systemctl status nginx
