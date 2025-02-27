# FROM ubuntu:16.04

# RUN apt-get -y update && apt-get -y upgrade
# RUN apt-get -y install apache2

# # RUN mkdir -p /etc/letsencrypt
# # COPY ./letsencrypt /etc/letsencrypt

# COPY ./apache2 /etc/apache2
# COPY ./html /var/www/html

# RUN ["a2ensite", "000-default-le-ssl"]
# EXPOSE 443 8443
# CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

FROM php:8.0-apache

COPY httpd.conf /etc/apache2/sites-available/
RUN rm -rf /etc/apache2/sites-available/000-default.conf
RUN a2enmod ssl rewrite headers

RUN mkdir -p /etc/letsencrypt
COPY ./letsencrypt /etc/letsencrypt

RUN a2ensite httpd.conf
COPY index.html /var/www/html/
RUN echo "Listen 8080" >> /etc/apache2/ports.conf
RUN echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

EXPOSE 8080

CMD ["apache2-foreground"]
