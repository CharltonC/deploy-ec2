######################
# NAMING CONVENTION
######################
# File/Folder/Path
#   FOLDER    e.g. 'foldername'
#   FILE      e.g. 'file.ext'

# DOES NOT WORK
#   PATH      e.g. 'path/subpath',  'path/subpath/file.ext'
#


# Project
PROJECT_ROOT_FOLDER='dev'
PROJECT_FOLDER='deploy-ec2'
PROJECT_DJANGO_FOLDER='deploy_ec2'

# Python Virtual Env. & Dependencies
PY_VENV_FOLDER='venv'
PY_VENV_DEP_LIST_FILE='requirements.txt'

# Ubuntu Dependencies
UBUNTU_APT_DEP_LIST='python3-pip python3-dev libpq-dev postgresql postgresql-contrib nginx'
UBUNTU_USERNAME='ubuntu'

# Aws
APP_IP_SELF='0.0.0.0'
APP_IP_ADDR=''
APP_PORT=80

# Django
DJ_STATIC_FOLDER='static'
DJ_MEDIA_FOLDER='media'
DJ_SUPERUSER_USERNAME='djsuperuser'
DJ_SUPERUSER_PASSWORD='djsuperuser1234'
DJ_SUPERUSER_EMAIL='xyz@xyz.com'

# Database
DB_SHELL_USERNAME='postgres'
DB_NAME='dbtest'
DB_USERNAME='dbtestuser'
DB_PASSWORD='dbtestpassword'

# Http Server - Gunicorn
GUNICORN_SOCKET_CONF_TEMPLATE_FILE="gunicorn.socket.template.sh"
GUNICORN_SERVICE_CONF_TEMPLATE_FILE="gunicorn.service.template.sh"
GUNICORN_SERVICE_CONF_FILE_PATH='/etc/systemd/system/gunicorn.service'
GUNICORN_SOCKET_CONF_FILE_PATH='/etc/systemd/system/gunicorn.socket'

# Proxy Server - Nginx
NGINX_CONF_ROOT_PATH='/etc/nginx/sites-available'
NGINX_CONF_TEMPLATE_FILE='nginx.conf.template.sh'
NGINX_SITE_ROOT_PATH='/etc/nginx/sites-enabled'

# Message when setup is Complete
logStart() {
    echo -e "\e[95m$1 setup started\e[0m"
}
logEnd() {
    echo -e "\e[95m$1 setup completed\e[0m\n"
}