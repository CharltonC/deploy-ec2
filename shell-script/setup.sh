######################
# GUIDE
######################
# Requirements:
# - SSH is Setup between Remote Host & Github for clone/pull
# - Executable permission is added for this Shell Script file via `chmod +x <fileName>.sh` (under project folder)

# File Usage (assume under parent folder):
# - `source` is for `source venv/bin/activate` to work (i.e. within from current shell context)
# - `sudo` is not required as any folder created via shell script will have permission issues in case of creating subfolder within them
# `source <fileName>.sh` or `. <fileName>.sh`
# or
# Place `#!/bin/bash` at top & 1st line of setup script


######################
# CONFIG/VARIABLES
######################
# Project
PROJECT_ROOT_FOLDER_NAME='dev'
PROJECT_FOLDER_NAME='deploy-ec2'
PROJECT_GIT_URL='git@github.com:CharltonC/deploy-ec2.git'

# Python Virtual Env. & Dependencies
PY_VENV_FOLDER_NAME='venv'
PY_VENV_DEP_LIST_FILE='requirements.txt'

# Ubuntu Dependencies
UBUNTU_APT_DEP='python3-pip python3-dev libpq-dev postgresql postgresql-contrib'

# Message when setup is Complete
create_msg() {
    echo "\e[95m$1\e[0m"
}
MSG_UBUNTU_COMPLETE=$( create_msg 'ubuntu setup complete' )
MSG_GIT_COMPLETE=$( create_msg 'git setup complete' )
MSG_PYTHON_COMPLETE=$( create_msg 'python setup complete' )
MSG_ALL_COMPLETE=$( create_msg 'all setup complete' )



######################
# TASKS
######################
# 1. Ubuntu - Locale & Packages
# - Setting time/local via `locale-gen en_GB.UTF-8` causes error e.g. "sed: couldn't open temporary file /etc/sedAdOVDr: Permission denied"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y $UBUNTU_APT_DEP
pip3 install virtualenv
echo -e $MSG_UBUNTU_COMPLETE


# 2. Git
# Create & Go into Project root folder (for all projects)
cd ~/
mkdir $PROJECT_ROOT_FOLDER_NAME

# Clone & Go into Project folder
cd ~/$PROJECT_ROOT_FOLDER_NAME
git clone $PROJECT_GIT_URL
echo -e $MSG_GIT_COMPLETE

# Switch branch if needed (todo)


# 3. Python
# Create/Activate Python Virtual Env.
cd ~/$PROJECT_ROOT_FOLDER_NAME/$PROJECT_FOLDER_NAME
python3 -m virtualenv $PY_VENV_FOLDER_NAME
source $PY_VENV_FOLDER_NAME/bin/activate

# Install dependencies & exit Virtual Env.
pip install -r $PY_VENV_DEP_LIST_FILE
deactivate
cd ~/
echo -e $MSG_PYTHON_COMPLETE


# Database (todo)


# Gunicorn (todo)


# Ngnix (todo)


# Django Settings (todo)


# Done
echo -e $MSG_ALL_COMPLETE
