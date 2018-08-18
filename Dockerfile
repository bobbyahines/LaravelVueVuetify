FROM php:7.1-apache
MAINTAINER "Bobby Hines <bobby@conflabs.com>"

# Install utility
RUN apt-get update && apt-get install -y build-essential curl libpng-dev nano wget zip

# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add nodesource repository to the container and install
RUN ["curl","-sL","https://deb.nodesource.com/setup_6.x","-o","nodesource_setup.sh"]
RUN ["bash","nodesource_setup.sh"]

RUN ["apt-get","install","-y","nodejs"]

#COPY ./ /var/www/html

# Configure virtual host
RUN echo '<VirtualHost *:80>' > /etc/apache2/sites-available/000-default.conf
RUN echo '' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	ServerAdmin webmaster@localhost' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	DocumentRoot /var/www/html/public' >> /etc/apache2/sites-available/000-default.conf
RUN echo '' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	ErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	CustomLog ${APACHE_LOG_DIR}/access.log combined' >> /etc/apache2/sites-available/000-default.conf
RUN echo '' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	<Directory /var/www/html/public>' >> /etc/apache2/sites-available/000-default.conf
RUN echo '        	Options Indexes FollowSymLinks MultiViews' >> /etc/apache2/sites-available/000-default.conf
RUN echo '        	AllowOverride All' >> /etc/apache2/sites-available/000-default.conf
RUN echo '        	Order allow,deny' >> /etc/apache2/sites-available/000-default.conf
RUN echo '        	allow from all' >> /etc/apache2/sites-available/000-default.conf
RUN echo '    	</Directory>' >> /etc/apache2/sites-available/000-default.conf
RUN echo '' >> /etc/apache2/sites-available/000-default.conf
RUN echo '</VirtualHost>' >> /etc/apache2/sites-available/000-default.conf

EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html
VOLUME /var/www/html