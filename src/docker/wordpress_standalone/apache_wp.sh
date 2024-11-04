#!/bin/sh
mkdir -p /srv/www
curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www
a2ensite wordpress && a2enmod rewrite && a2dissite 000-default
mysqlpassword=$(echo $RANDOM | md5sum | head -c 15; echo;)
unique=$(echo $RANDOM | md5sum | head -c 20; echo;)
mysqlhost="127.0.0.1"
service mysql start
mysql -u root -Bse "CREATE DATABASE IF NOT EXISTS wordpress; CREATE USER IF NOT EXISTS wordpress@localhost IDENTIFIED BY '$mysqlpassword'; GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO 'wordpress'@'localhost'; FLUSH PRIVILEGES;"
cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sed -i "s/localhost/$mysqlhost/" /srv/www/wordpress/wp-config.php
sed -i "s/password_here/$mysqlpassword/" /srv/www/wordpress/wp-config.php
sed -i "s/put your unique phrase here/$unique/" /srv/www/wordpress/wp-config.php
chown --recursive www-data: /srv/www
apachectl -D FOREGROUND