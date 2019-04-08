echo "$(cat <<EOF
server {
	listen $APP_PORT;
	server_name $APP_IP_ADDR;

	location = /favicon.ico {
		access_log off;
		log_not_found off;
	}

	location /$DJ_STATIC_FOLDER/ {
		root /home/$UBUNTU_USERNAME/$PROJECT_ROOT_FOLDER_NAME/$PROJECT_FOLDER_NAME;
	}

	location /$DJ_MEDIA_FOLDER/ {
		root /home/$UBUNTU_USERNAME/$PROJECT_ROOT_FOLDER_NAME/$PROJECT_FOLDER_NAME;
	}

	location / {
		include proxy_params;
		proxy_pass http://unix:/run/gunicorn.sock;
	}
}
)"
