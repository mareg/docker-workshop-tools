#!/bin/sh

if [ ! -f /usr/bin/apt-get ]
then
    echo "Is it Ubuntu? This script is designed to run on Ubuntu (and compatible) systems only."
    exit 1
fi

# Update index
sudo apt-get update

sudo install -y vim mysql-client composer php-mbstring php-dom
