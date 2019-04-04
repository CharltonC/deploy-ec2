#!/bin/bash

######################
# GUIDE
######################
# Requirements:
# - SSH is Setup between Remote Host & Github for clone/pull
# - Executable permission is added for this Shell Script file via `chmod +x <fileName>.sh` (under project folder)

# Usage (under project folder):
# `sudo <fileName>.sh`


######################
# CONFIG/VARIABLES
######################
# Project
PROJECT_ROOT_FOLDER_NAME='dev'
PROJECT_FOLDER_NAME='deploy-ec2'
PROJECT_GIT_URL='git@github.com:CharltonC/deploy-ec2.git'

# Python Virtual Env. & Dependencies
PY_VENV_FOLDER_NAME='venv'
PY_VENV_PATH='~/dev/test'
PY_VENV_DEP_LIST_FILE='requirements.txt'

# Ubuntu Dependencies
UBUNTU_APT_DEP='python3-pip python3-dev libpq-dev postgresql postgresql-contrib'

# Message when setup is Complete
MSG_UBUNTU_COMPLETE='ubuntu setup complete'
MSG_GIT_COMPLETE='git setup complete'
MSG_PYTHON_COMPLETE='python setup complete'
MSG_ALL_COMPLETE='all setup complete'


######################
# TASKS
######################
# 1. Ubuntu - Locale & Packages
locale-gen en_GB.UTF-8
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y $UBUNTU_APT_DEP
echo $MSG_UBUNTU_COMPLETE


# 2. Git
# Create & Go into Project root folder (for all projects)
cd ~/
mkdir $PROJECT_ROOT_FOLDER_NAME
cd $PROJECT_ROOT_FOLDER_NAME

# Clone & Go into Project folder
git clone $PROJECT_GIT_URL
cd $PROJECT_FOLDER_NAME
echo $MSG_GIT_COMPLETE

# Switch branch if needed (todo)


# 3. Python
# Create/Activate Python Virtual Env.
python3 -m virtualenv $PY_VENV_FOLDER_NAME
source $PY_VENV_FOLDER_NAME/bin/activate

# Install dependencies
pip install -r $PY_VENV_DEP_LIST_FILE
echo $MSG_PYTHON_COMPLETE


# Database (todo)


# Gunicorn (todo)


# Ngnix (todo)


# Django Settings (todo)


# Done
echo $MSG_ALL_COMPLETE
