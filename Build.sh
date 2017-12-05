# By EggOxygen
#
# LAMP + WE
# UDT - 1205
# OS Request : Ubuntu16

# First Update
sudo apt-get update
sudo apt-get -y upgrade

#Download Etc.
sudo apt-get -y install curl wget axel unzip

# Apache2 + MySQL + PHP5.6
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

# PHP5
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php5.6

# PHP + SQL
sudo apt-get install -y php5.6-mysql

# PHP + Apache2
sudo apt-get install -y libapache2-mod-php5.6
sudo service apache2 restart

# WE
cd /var/www/html/
rm -rf *
wget https://www.we7.cc/download/WeEngine-Laster-Offline.zip
unzip *
rm WeEngine-Laster-Offline.zip
chmod -R 0777 /var/www/html

# WE MOD
apt-get install -y php5.6-curl php5.6-gd php5.6-xml php5.6-mcrypt

# NOTICE
echo "重启之后访问 IP/install.php 即可开始安装微擎"

# Reboot
reboot