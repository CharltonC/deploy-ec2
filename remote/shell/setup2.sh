#!/bin/bash

# Global Config Variable (working)
# - `$(dirname $0)` or `${0%/*}` means current directory to make sure the relative path is always working
CURR_PATH=${0%/*}
source $CURR_PATH/config.sh


# Ubuntu - Locale & Packages (working)
logStart 'Ubuntu'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y $UBUNTU_APT_DEP_LIST
pip3 install virtualenv
logEnd 'Ubuntu'


# Python (working)
logStart 'Python Virtual Env.'
cd $PROJECT_PATH
python3 -m virtualenv $PY_VENV_FOLDER
source $PY_VENV_FOLDER/bin/activate
pip install -r $PY_VENV_DEP_LIST_FILE_PATH
logEnd 'Python Virtual Env.'


# Database - PostgreSQL (working)
sudo -u $DB_SHELL_USERNAME psql <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER $DB_USERNAME WITH PASSWORD '$DB_PASSWORD';
ALTER ROLE $DB_USERNAME SET client_encoding TO 'utf8';
ALTER ROLE $DB_USERNAME SET default_transaction_isolation TO 'read committed';
ALTER ROLE $DB_USERNAME SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USERNAME;
EOF


# Http Web Server - Gunicorn
logStart 'Gunicorn'
source $GUNICORN_SERVICE_CONF_TEMPLATE_FILE_PATH > $GUNICORN_SERVICE_CONF_FILE_PATH
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
logEnd 'Gunicorn'


# Proxy Server - Nginx
logStart 'Nginx'
source $NGINX_CONF_TEMPLATE_FILE_PATH > $NGINX_CONF_FILE_PATH
sudo ln -s $NGINX_CONF_FILE_PATH $NGINX_CONF_ROOT_PATH
sudo nginx -t
sudo systemctl restart nginx
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
