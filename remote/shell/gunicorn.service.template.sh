echo "$(cat <<EOF
[Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=$UBUNTU_USERNAME
Group=www-data
WorkingDirectory=/home/$UBUNTU_USERNAME/$PROJECT_ROOT_FOLDER/$PROJECT_FOLDER
ExecStart=/home/$UBUNTU_USERNAME/$PROJECT_ROOT_FOLDER/$PROJECT_FOLDER/$PY_VENV_FOLDER/bin/gunicorn \
	--access-logfile -\
	--workers 3 \
	--bind unix:$GUNICORN_SOCKET_CONF_FILE_PATH $PROJECT_FOLDER.wsgi:application

[Install]
WantedBy=multi-user.target
EOF
)"