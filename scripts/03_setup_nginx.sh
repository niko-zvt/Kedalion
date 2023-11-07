sudo apt update

sudo apt install nginx

# Remove default site
sudo rm /etc/nginx/sites-enabled/default

# Back up the default nginx.conf
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bck

# Copy nginx config
sudo cp ./nginx.conf /etc/nginx/nginx.conf

# Test nginx config
sudo nginx -t

# Reload nginx
sudo systemctl reload nginx

# Create folders
sudo mkdir -p /var/www/zhivotenko.com/html

# Apply appropriate permissions
sudo chown -R $USER:$USER /var/www/zhivotenko.com/html
sudo chmod -R 755 /var/www

# Copy files
sudo cp -r ./site/. /var/www/zhivotenko.com/html/

# Copy site config
sudo cp ./zhivotenko.com.conf /etc/nginx/sites-available/zhivotenko.com

# Enable site
sudo ln -s /etc/nginx/sites-available/zhivotenko.com /etc/nginx/sites-enabled/

# Test site config
sudo nginx -t

# Reload nginx
sudo systemctl reload nginx

# Get nginx status
sudo systemctl status nginx
