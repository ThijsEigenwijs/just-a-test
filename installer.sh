#!/bin/bash

if [ "$(whoami)" != "root" ]; then
	echo "Sorry, you are not root."
	exit 1
fi

echo "Executed as root user, thanks!"
echo "Installing OrangeScrum on your server"
echo "Please grab a beer while your awaite"

sudo apt install apache2
systemctl enable apache2
systemctl start apache2
sudo systemctl status apache2
sudo apt install unzip wget php7.2 php7.2-bcmath php7.2-cgi php7.2-cli php7.2-common php-curl php7.2-dba php7.2-enchant php7.2-fpm php7.2-gd php7.2-imap php7.2-intl php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-opcache php-imagick php-memcache php7.2-soap php7.2-tidy php7.2-xml php7.2-zip libapache2-mod-php7.2 xvfb libfontconfig wkhtmltopdf

 