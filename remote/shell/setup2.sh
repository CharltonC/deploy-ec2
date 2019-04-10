#!/bin/bash

# Global Config Variable (working)
source ~/dev/deploy-ec2/remote/shell/config.sh


# Ubuntu - Locale & Packages (working)
logStart 'Ubuntu'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y $UBUNTU_APT_DEP_LIST
pip3 install virtualenv
logEnd 'Ubuntu'


# Python (working)
logStart 'Python Virtual Env.'
cd ~/${PROJECT_ROOT_FOLDER}/${PROJECT_FOLDER}
python3 -m virtualenv $PY_VENV_FOLDER
source $PY_VENV_FOLDER/bin/activate
pip install -r $PY_VENV_DEP_LIST_FILE
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


# Http Web Server - Gunicorn (working)
logStart 'Gunicorn'
source ~/$PROJECT_ROOT_FOLDER/$PROJECT_FOLDER/remote/shell/$GUNICORN_SOCKET_CONF_TEMPLATE_FILE > $GUNICORN_SOCKET_CONF_FILE_PATH
source ~/$PROJECT_ROOT_FOLDER/$PROJECT_FOLDER/remote/shell/$GUNICORN_SERVICE_CONF_TEMPLATE_FILE > $GUNICORN_SERVICE_CONF_FILE_PATH
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
logEnd 'Gunicorn'


# Proxy Server - Nginx (working)
logStart 'Nginx'
source ~/$PROJECT_ROOT_FOLDER/$PROJECT_FOLDER/remote/shell/$NGINX_CONF_TEMPLATE_FILE > $NGINX_CONF_ROOT_PATH/$PROJECT_FOLDER
sudo ln -s $NGINX_CONF_ROOT_PATH/$PROJECT_FOLDER $NGINX_SITE_ROOT_PATH
sudo nginx -t
sudo systemctl restart nginx
logEnd 'Nginx'


# Django (requires venv)
logStart 'Django'
# TODO: Create Super user first
cd ~/$PROJECT_ROOT_FOLDER/$PROJECT_FOLDER/deploy_ec2
python manage.py makemigrations
python manage.py migrate
python manage.py collecstatic
logEnd 'Django'


# Done
logEnd 'All'
