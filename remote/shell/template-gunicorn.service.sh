echo "$(cat <<EOF
[Unit]
Description=gunicorn daemon
After=network.target

[Service]
User=$UBUNTU_USERNAME
Group=www-data
WorkingDirectory=$PROJECT_FOLDER_ABS_PATH/$PROJECT_DJANGO_FOLDER
ExecStart=$PROJECT_FOLDER_ABS_PATH/venv/bin/gunicorn --access-logfile - --workers 3 --bind unix:$PROJECT_FOLDER_ABS_PATH/$PROJECT_DJANGO_FOLDER.sock $PROJECT_DJANGO_FOLDER.wsgi:application

[Install]
WantedBy=multi-user.target
EOF
)"