#!/bin/bash

# This file requires `sudo` when running the file

logStart 'Gunicorn'
source $GUNICORN_SERVICE_CONF_TEMPLATE_FILE > $GUNICORN_SERVICE_CONF_FILE_PATH  # this requires `sudo`
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
logEnd 'Gunicorn'