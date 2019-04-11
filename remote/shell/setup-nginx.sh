#!/bin/bash

# This file requires `sudo`
logStart 'Nginx'

# Generate a Nginx config file from the template
# - redirect output `> <file.ext>` is not used here due to permission, `| sudo tee <file.ext>` is used instead
# - use `</dev/null` at the end to hide the output of cmd, e.g. `source ... </dev/null`
source $NGINX_CONF_TEMPLATE_FILE_PATH | sudo tee $NGINX_CONF_FILE_PATH       # requires `sudo`

# Link the Nginx config file to the Nginx's "sites-enabled" directory
sudo ln -s $NGINX_CONF_FILE_PATH $NGINX_SITE_ROOT_PATH

# Check the Nginx Config & Restart Nginx
sudo nginx -t && sudo systemctl restart nginx

logEnd 'Nginx'