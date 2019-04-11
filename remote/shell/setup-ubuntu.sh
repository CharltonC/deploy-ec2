#!/bin/bash

logStart 'Ubuntu'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y $UBUNTU_APT_DEP_LIST
pip3 install virtualenv
logEnd 'Ubuntu'