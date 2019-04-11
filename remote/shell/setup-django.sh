#!/bin/bash

logStart 'Django'
cd $PROJECT_DJANGO_FOLDER_PATH
python manage.py createsuperuser
python manage.py makemigrations
python manage.py migrate
python manage.py collecstatic
logEnd 'Django'
