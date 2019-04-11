#!/bin/bash

logStart 'Python Virtual Env.'

# Create a Virtual Env. folder under the project folder
cd $PROJECT_FOLDER_PATH
python3 -m virtualenv $PY_VENV_FOLDER

# Activate the Virtual Env. & Install the dependency
source $PY_VENV_FOLDER/bin/activate
pip install -r $PY_VENV_DEP_LIST_FILE_PATH

# Exit the Virtual Env.
deactivate

logEnd 'Python Virtual Env.'