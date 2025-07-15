#!/bin/bash

<< task
deploy a django app
Handle the errors
task


code_clone(){
	echo "cloning the repository"
	git clone https://github.com/LondheShubham153/django-notes-app
}

install_requirements(){
	echo "Installing dependencies"
	sudo apt-get install docker.io docker-compose 
}

required_restarts(){
	sudo chown $USER /var/run/docker.sock 
	sudo systemctl enable docker
	sudo systemctl enable nginx
      	sudo systemctl restart docker	
}

deploy(){
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
	#docker-compose -d
}


echo "************ STARTED DEPLOYMENT****************"
if ! code_clone; then
	cd django-notes-app
	echo "cannot clone the repository as the directory already exists"
fi


if ! install_requirements; then 
	"echo some error occured while downloading dependencies"
	exit 1
fi


if ! required_restarts; then 
	echo "System fault identified"
	exit 1
fi



deploy
echo "************* DEPLOYMENT COMPLETED*************"

:
