#!/bin/bash

logStart 'Python Virtual Env.'
cd $PROJECT_FOLDER_PATH
python3 -m virtualenv $PY_VENV_FOLDER
source $PY_VENV_FOLDER/bin/activate
pip install -r $PY_VENV_DEP_LIST_FILE_PATH
logEnd 'Python Virtual Env.'