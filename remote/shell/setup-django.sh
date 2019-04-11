#!/bin/bash

logStart 'Django'
source $PROJECT_FOLDER_PATH/venv/bin/activate
cd $PROJECT_DJANGO_FOLDER_PATH
python manage.py createsuperuser
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic
logEnd 'Django'
