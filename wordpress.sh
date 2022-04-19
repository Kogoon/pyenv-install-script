#!/bin/bash

echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
echo "------------ Team 1 Hera                          ---------------"
echo "--------------------------- install Wordpress     ---------------"
echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
sleep 3

yum update -y

yum install -y wget

yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm 
yum -y install epel-release yum-utils

yum-config-manager --enable remi-php74

yum -y install php

yum -y install php-fpm

yum -y install  php-cli  php-redis  php-brotli php-intl php-gd php-gmp php-imap php-bcmath php-interbase php-json php-mbstring php-mysqlnd php-odbc php-opcache php-memcached php-tidy php-pdo php-pdo-dblib php-pear php-pgsql php-process php-pecl-apcu php-pecl-geoip php-pecl-imagick php-pecl-hrtime php-pecl-json php-pecl-memcache php-pecl-mongodb php-pecl-rar php-pecl-pq php-pecl-redis4 php-pecl-yaml php-pecl-zip


echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
echo "------------ Team 1 Hera                          ---------------"
echo "--------------------------- install Wordpress     ---------------"
echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
sleep 3

wget -c https://wordpress.org/latest.tar.gz -P /var/www/html/

tar xvzf /var/www/html/latest.tar.gz -C /var/www/html/

ls -al /var/www/html

chown -R apache: /var/www/html/wordpress

echo "vi /etc/httpd/conf/httpd.conf Need Modified"

echo \
"
<VirtualHost *:80>
        ServerName 1hera.shop
        DocumentRoot /var/www/html/wordpress
        ErrorLog /var/log/httpd/mywordpress-error-log
        CustomLog /var/log/httpd/mywordpress-acces-log combined
</VirtualHost>
" >> /etc/httpd/conf/httpd.conf

echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
echo "------------ Team 1 Hera                          ---------------"
echo "--------------------------- install Wordpress     ---------------"
echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"

setenforce 0 

yum install -y httpd 
systemctl enable --now httpd

firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload
