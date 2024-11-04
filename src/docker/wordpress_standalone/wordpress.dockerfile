# Dockerfile for creating a wordpress image with mysql daatabase
FROM ubuntu:latest
# Install dependencies and wordpress
EXPOSE 80:80
#VOLUME ["/var/www", "/var/log/apache2", "/var/lib/mysql"]
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2 \
curl \
ghostscript \
libapache2-mod-php \
mysql-server \
php \
php-bcmath \
php-curl \
php-imagick \
php-intl \
php-json \
php-mbstring \
php-mysql \
php-xml \
php-zip
COPY apache_wp.sh /var/tmp/apache_wp.sh
COPY apache.conf /etc/apache2/sites-available/wordpress.conf
ENTRYPOINT ["/var/tmp/apache_wp.sh"]