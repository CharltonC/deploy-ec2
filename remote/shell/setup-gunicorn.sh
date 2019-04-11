#!/bin/bash

logStart 'Gunicorn'

# Generate a Gunicorn config file from the template
sudo -s source $GUNICORN_SERVICE_CONF_TEMPLATE_FILE > $GUNICORN_SERVICE_CONF_FILE_PATH  # this requires `sudo`

# Start Gunicorn & Enable (which automatically creates a Gunicorn socket file)
sudo systemctl start gunicorn && sudo systemctl enable gunicorn

logEnd 'Gunicorn'