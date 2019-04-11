#!/bin/bash

logStart 'Ubuntu'

# Update the package Listing
sudo apt-get update

# Upgrade the package (yes to all prompts)
sudo apt-get upgrade -y

# Install the packages (yes to all prompts)
sudo apt-get install -y $UBUNTU_APT_DEP_LIST

# Install Python Virtual Env. as Global (after python installed from the ubuntu packages)
# - this requires the main shell script to be run as `source <path>/<script>.sh`,
#   not `sudo <path>/<script>.sh` or `sudo -s source <path>/<script>.sh`
pip3 install virtualenv

logEnd 'Ubuntu'