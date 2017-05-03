#!/bin/sh

if [ ! -f /usr/bin/apt-get ]
then
    echo "Is it Ubuntu? This script is designed to run on Ubuntu (and compatible) systems only."
    exit 1
fi

# Remove old docker
sudo apt-get remove docker docker-engine

# Make sure required extensions and certificates are installed
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add docker's certificate
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Install docker repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update apt index
sudo apt-get update

# Install docker ee
sudo apt-get install docker-ce

# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose
chmod +x ./docker-compose
sudo move ./docker-compose /usr/local/bin/docker-compose

# Verify docker is running
sudo docker run hello-world

# Add user to the docker group
sudo usermod -aG docker $USER

echo "You'll need to log out and log in to access docker without sudo."
