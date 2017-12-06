# By EggOxygen
#
# LAMP + WE
# UDT - 1206
# OS Request : Ubuntu16

# PHP Version
echo -e "0 - PHP5.6 | 1 - PHP7.0"
read -p "Make your choice : " php_version
if [ $php_version == 0 ]; then
	php_b="php5.6"
else
	php_b="php7.0"
fi

# First Update
sudo apt-get update
sudo apt-get -y upgrade

# Install Etc.
sudo apt-get -y install curl wget unzip

# Apache2
sudo apt-get -y install apache2
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo service apache2 restart

# MySQL
wget https://dev.mysql.com/get/mysql-apt-config_0.8.8-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.8-1_all.deb
sudo apt-get update
sudo apt-get install -y mysql-server

# PHP
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y $php_b

# PHP + SQL
sudo apt-get install -y $php_b-mysql

# PHP + Apache2
sudo apt-get install -y libapache2-mod-$php_b
sudo service apache2 restart

# Remove
rm mysql-apt-config_0.8.8-1_all.deb

# WE
rm -rf /var/www/html/*
cd /var/www/html/
wget https://www.we7.cc/download/WeEngine-Laster-Offline.zip
unzip *
rm WeEngine-Laster-Offline.zip
chmod -R 0777 /var/www/html

# WE MOD
sudo apt-get install -y $php_b-curl $php_b-gd $php_b-xml $php_b-mcrypt


# NOTICE
echo "重启之后访问 本服务器的IP/install.php 即可开始安装微擎"

# Reboot
reboot