FROM php:7.2.30-apache

RUN apt-get update && \
	apt-get install -y vim

COPY setup.sh /usr/local/bin/
COPY template /var/apache2/
COPY conf/ /etc/apache2

RUN a2enmod proxy proxy_http
RUN a2ensite 000-* 001-*

CMD ["setup.sh"]