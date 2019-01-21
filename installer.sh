#!/bin/bash

if [ "$(whoami)" != "root" ]; then
	echo "Sorry, you are not root."
	exit 1
fi

init_mysql=0
auto_start=0

while [ "$1" != "" ]; do
    case $1 in
        --mysql )          shift
                           init_mysql=1
                           ;;
        --installer )      auto_start=1
                           ;;
        -h | --help )      usage
                           exit
                           ;;
        * )                usage
                           exit 1
    esac
    shift
done

echo "Executed as root user, thanks!"
echo "Installing OpenProject on your server"
echo "Please grab a beer while your awaite"

sudo apt update
sudo apt -y install apt-transport-https memcached
wget -qO- https://dl.packager.io/srv/opf/openproject-ce/key | sudo apt-key add -
sudo add-apt-repository universe
sudo wget -O /etc/apt/sources.list.d/openproject-ce.list https://dl.packager.io/srv/opf/openproject-ce/stable/8/installer/ubuntu/18.04.repo
sudo apt -y install mysql-server libmysqlclient-dev mysql-client

if [init_mysql == 1]; then
echo "CREATE USER 'openproject'@'localhost' IDENTIFIED BY '5GqhRkyGefxWZU2b';" | sudo mysql
echo "CREATE DATABASE openproject CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" | sudo mysql
echo "GRANT ALL PRIVILEGES ON openproject.* TO 'openproject'@'localhost';" | sudo mysql
echo "FLUSH PRIVILEGES;" | sudo mysql
fi

sudo apt update
sudo apt -y install openproject

echo "Password for the MySQL is: 5GqhRkyGefxWZU2b"
echo "Please follow the installer"

if [auto_start == 1]; then
openproject reconfigure
fi