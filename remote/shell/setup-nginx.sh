#!/bin/bash

logStart 'Nginx'
source $NGINX_CONF_TEMPLATE_FILE_PATH > $NGINX_CONF_ROOT_PATH/$PROJECT_FOLDER
sudo ln -s $NGINX_CONF_FILE_PATH $NGINX_SITE_ROOT_PATH
sudo nginx -t
sudo systemctl restart nginx
logEnd 'Nginx'