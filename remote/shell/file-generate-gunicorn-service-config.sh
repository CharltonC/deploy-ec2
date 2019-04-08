echo "$(cat <<EOF
[Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=$UBUNTU_USERNAME
Group=www-data
WorkingDirectory=/home/$UBUNTU_USERNAME/$PROJECT_ROOT_FOLDER_NAME/$PROJECT_FOLDER_NAME
ExecStart=/home/$UBUNTU_USERNAME/$PROJECT_ROOT_FOLDER_NAME/$PROJECT_FOLDER_NAME/$PY_VENV_FOLDER_NAME/bin/gunicorn \
	--access-logfile -\
	--workers 3 \
	--bind unix:/run/gunicorn.sock \
	djangoProjectName.wsgi:application

[Install]
WantedBy=multi-user.target
)"
