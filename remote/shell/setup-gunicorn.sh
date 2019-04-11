#!/bin/bash

logStart 'Gunicorn'
source $GUNICORN_SOCKET_CONF_TEMPLATE_FILE_PATH > $GUNICORN_SOCKET_CONF_FILE_PATH
source $GUNICORN_SERVICE_CONF_TEMPLATE_FILE > $GUNICORN_SERVICE_CONF_FILE_PATH
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
logEnd 'Gunicorn'