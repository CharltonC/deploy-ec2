#!/bin/bash

# Global Config Variable
source ./config.sh


# Ubuntu - Locale & Packages
logStart 'Ubuntu'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y $UBUNTU_APT_DEP
pip3 install virtualenv
logEnd 'Ubuntu'


# Python
logStart 'Python Virtual Env.'
cd ~/$PROJECT_ROOT_FOLDER_NAME/$PROJECT_FOLDER_NAME
python3 -m virtualenv $PY_VENV_FOLDER_NAME
source $PY_VENV_FOLDER_NAME/bin/activate
pip install -r $PY_VENV_DEP_LIST_FILE
logEnd 'Python Virtual Env.'


# Database - PostgreSQL
sudo psql -u $DB_SHELL_USERNAME -c $(source ./database-sql.sh)


# Http Web Server - Gunicorn
logStart 'Gunicorn'
gunicorn --bind $APP_IP_ADDR:$APP_PORT $PROJECT_FOLDER_NAME.wsgi
sudo source ./file-generate-gunicorn-service-config.sh > $GUNICORN_SERVICE_CONF_FILE
sudo source ./file-generate-gunicorn-socket-config.sh > $GUNICORN_SOCKET_CONF_FILE
sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket
sudo systemctl status gunicorn.socket
logEnd 'Gunicorn'


# Proxy Server - Nginx
logStart 'Nginx'
sudo source ./file-generate-nginx-config.sh > $NGINX_CONF_FILE
sudo ln -s /etc/nginx/site-available/$PROJECT_FOLDER_NAME /etc/nginx/sites-enabled
# sudo ufw allow 'Ngnix Full'
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl restart gunicorn
logEnd 'Nginx'


# Django
logStart 'Django'
# TODO: Create Super user first
python manage.py makemigrations
python manage.py migrate
python manage.py collecstatic
logEnd 'Django'


# Done
logEnd 'All'
