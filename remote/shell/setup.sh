######################
# GUIDE
######################
# Requirements:
# - SSH must be setup between Remote Host & Github for clone/pull
# - SSH Agent needs to be eval (required for AWS EC2)
# - Executable permission is added for this Shell Script file via `chmod +x <fileName>.sh` (under project folder)

# Usage Syntax:
# 1. Local - Copy the SSH keys from Local to Remote ".ssh" folder, Login
#   scp -i ~/.ssh/<awsKey>.pem <sshKeyPath>/{id_rsa,id_rsa.pub} <userName>@<vpsPublicDnsIpAddr>:/home/<userName>/.ssh/
#   ssh -i ~/.ssh/<awsKey>.pem <userName>@<vpsPublicDnsIpAddr>
#
# 2. Remote - Setup project & Run its Setup Shell Script:
#   eval $(ssh-agent) && cd ~/ && mkdir <projectRootName> && cd <projectRootName> && git clone <gitProjectUrl>
#   cd <projectFolder>/<shellFolder> && chmod +x <setupScript>.sh && source ./<setupScript>.sh

# Usage Example:
# 1. Local:
# scp -i ~/.ssh/aws-ec2.pem ssh/{id_rsa,id_rsa.pub} ubuntu@ec2-13-210-68-168.ap-southeast-2.compute.amazonaws.com:/home/ubuntu/.ssh/
# ssh -i ~/.ssh/aws-ec2.pem ubuntu@ec2-13-210-68-168.ap-southeast-2.compute.amazonaws.com
#
# 2. Remote:
# eval $(ssh-agent) && cd ~/ && mkdir dev && cd dev && git clone git@github.com:CharltonC/deploy-ec2.git
# cd deploy-ec2/shell && chmod +x setup.sh && source ./setup.sh


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
