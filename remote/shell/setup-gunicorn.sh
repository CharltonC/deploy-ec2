#!/bin/bash

logStart 'Gunicorn'

# Generate a Gunicorn config file from the template
# - redirect output `> <file.ext>` is not used here due to permission, `| sudo tee <file.ext>` is used instead
# - use `</dev/null` at the end to hide the output of cmd, e.g. `source ... </dev/null`
source $GUNICORN_SERVICE_CONF_TEMPLATE_FILE | sudo tee $GUNICORN_SERVICE_CONF_FILE_PATH  # this requires `sudo`

# Start Gunicorn & Enable (which automatically creates a Gunicorn socket file)
sudo systemctl start gunicorn && sudo systemctl enable gunicorn

logEnd 'Gunicorn'