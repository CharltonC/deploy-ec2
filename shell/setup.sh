######################
# GUIDE
######################
# Requirements:
# - SSH is Setup between Remote Host & Github for clone/pull
# - Executable permission is added for this Shell Script file via `chmod +x <fileName>.sh` (under project folder)

# File Usage (assume under parent folder):
# `source <fileName>.sh` or `. <fileName>.sh`


######################
# CONFIG/VARIABLES
######################
# Project
PROJECT_ROOT_FOLDER_NAME='dev'
PROJECT_FOLDER_NAME='deploy-ec2'

# Python Virtual Env. & Dependencies
PY_VENV_FOLDER_NAME='venv'
PY_VENV_DEP_LIST_FILE='requirements.txt'

# Ubuntu Dependencies
UBUNTU_APT_DEP='python3-pip python3-dev libpq-dev postgresql postgresql-contrib'

# Message when setup is Complete
logStart() {
    echo -e "\e[95m$1 setup started\e[0m"
}
logEnd() {
    echo -e "\e[95m$1 setup completed\e[0m\n"
}


######################
# TASKS
######################
# 1. Ubuntu - Locale & Packages
logStart 'Ubuntu'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y $UBUNTU_APT_DEP
pip3 install virtualenv
logEnd 'Ubuntu'


# 2. Git
# Switch branch if needed (todo)


# 3. Python
# Create/Activate Python Virtual Env.
logStart 'Python Virtual Env.'
cd ~/$PROJECT_ROOT_FOLDER_NAME/$PROJECT_FOLDER_NAME
python3 -m virtualenv $PY_VENV_FOLDER_NAME
source $PY_VENV_FOLDER_NAME/bin/activate

# Install dependencies & exit Virtual Env.
pip install -r $PY_VENV_DEP_LIST_FILE
logEnd 'Python Virtual Env.'


# Database (todo)


# Gunicorn (todo)


# Ngnix (todo)


# Django Settings (todo)


# Done
logEnd 'All'
