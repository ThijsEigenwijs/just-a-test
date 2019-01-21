#!/bin/bash

if [ "$(whoami)" != "root" ]; then
	echo "Sorry, you are not root."
	exit 1
fi

echo "Executed as root user, thanks!"
echo "Installing OpenProject on your server"
echo "Please grab a beer while your awaite"

sudo apt update
sudo apt -y install apt-transport-https memcached
wget -qO- https://dl.packager.io/srv/opf/openproject-ce/key | sudo apt-key add -
sudo add-apt-repository universe
sudo wget -O /etc/apt/sources.list.d/openproject-ce.list https://dl.packager.io/srv/opf/openproject-ce/stable/8/installer/ubuntu/18.04.repo
sudo apt -y install mysql-server libmysqlclient-dev mysql-client
echo "CREATE USER 'openproject'@'localhost' IDENTIFIED BY '5GqhRkyGefxWZU2b';" | sudo mysql
echo "CREATE DATABASE openproject CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" | sudo mysql
echo "GRANT ALL PRIVILEGES ON openproject.* TO 'openproject'@'localhost';" | sudo mysql
echo "FLUSH PRIVILEGES;" | sudo mysql
sudo apt update
sudo apt -y install openproject

echo "Password for the MySQL is: 5GqhRkyGefxWZU2b"
echo "Please follow the installer"

openproject reconfigure