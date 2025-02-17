# Dockerfile for creating a wordpress image with mysql daatabase
FROM ubuntu:latest
# Install dependencies and wordpress
VOLUME ["/srv/www", "/var/lib/mysql"]
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
php-zip \
certbot \
python3-certbot-apache \
cron
COPY apache_wp.sh /var/tmp/apache_wp.sh
COPY apache.conf /etc/apache2/sites-available/wordpress.conf
COPY apache_domain.conf /etc/apache2/sites-available/wordpress_domain.conf
RUN chmod +x /var/tmp/apache_wp.sh
ENTRYPOINT ["/var/tmp/apache_wp.sh"]