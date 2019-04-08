# Project
PROJECT_ROOT_FOLDER_NAME='dev'
PROJECT_FOLDER_NAME='deploy-ec2'

# Python Virtual Env. & Dependencies
PY_VENV_FOLDER_NAME='venv'
PY_VENV_DEP_LIST_FILE='remote/requirements.txt'

# Ubuntu Dependencies
UBUNTU_APT_DEP='python3-pip python3-dev libpq-dev postgresql postgresql-contrib nginx'
UBUNTU_USERNAME='ubuntu'

# Aws
APP_IP_SELF='0.0.0.0'
APP_IP_ADDR=''
APP_PORT=8000

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

# Server
GUNICORN_SERVICE_CONF_FILE='/etc/systemd/system/gunicorn.service'
GUNICORN_SOCKET_CONF_FILE='/etc/systemd/system/gunicorn.socket'
NGINX_CONF_FILE="/etc/nginx/sites-available/$PROJECT_FOLDER_NAME"

# Message when setup is Complete
logStart() {
    echo -e "\e[95m$1 setup started\e[0m"
}
logEnd() {
    echo -e "\e[95m$1 setup completed\e[0m\n"
}