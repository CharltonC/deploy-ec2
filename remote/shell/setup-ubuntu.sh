#!/bin/bash

logStart 'Ubuntu'

# Update the package Listing
sudo apt-get update

# Upgrade the package (yes to all prompts)
sudo apt-get upgrade -y

# Install the packages (yes to all prompts)
sudo apt-get install -y $UBUNTU_APT_DEP_LIST

# Install Python Virtual Env. as Global (after python installed from the ubuntu packages)
pip3 install virtualenv

logEnd 'Ubuntu'