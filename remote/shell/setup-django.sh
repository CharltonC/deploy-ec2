#!/bin/bash

logStart 'Django'

# Go into the Django project folder (generated by `django-admin.py startproject ...`)
source $PROJECT_FOLDER_PATH/venv/bin/activate
cd $PROJECT_DJANGO_FOLDER_PATH

# Create an admin user (with prompts)
#python manage.py createsuperuser

# Update the Database
python manage.py makemigrations
python manage.py migrate

# Generate/Copy the Static Files
python manage.py collectstatic

logEnd 'Django'
