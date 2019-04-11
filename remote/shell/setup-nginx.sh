#!/bin/bash

# This file requires `sudo`

logStart 'Nginx'
source $NGINX_CONF_TEMPLATE_FILE_PATH > $NGINX_CONF_FILE_PATH       # requires `sudo`
sudo ln -s $NGINX_CONF_FILE_PATH $NGINX_SITE_ROOT_PATH
sudo nginx -t
sudo systemctl restart nginx
logEnd 'Nginx'