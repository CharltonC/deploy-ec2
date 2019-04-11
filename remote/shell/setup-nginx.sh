#!/bin/bash

# This file requires `sudo`
logStart 'Nginx'

# Generate a Nginx config file from the template
sudo -s source $NGINX_CONF_TEMPLATE_FILE_PATH > $NGINX_CONF_FILE_PATH       # requires `sudo`

# Link the Nginx config file to the Nginx's "sites-enabled" directory
sudo ln -s $NGINX_CONF_FILE_PATH $NGINX_SITE_ROOT_PATH

# Check the Nginx Config & Restart Nginx
sudo nginx -t && sudo systemctl restart nginx

logEnd 'Nginx'