FROM php:7.1-latest
MAINTAINER "Bobby Hines <bobby@conflabs.com>"

# Install utility
RUN ["apt-get","update"]
RUN ["apt-get","install","-y","build-essential","curl","nano","wget","zip"]

# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add nodesource repository to the container and install
RUN ["curl","-sL","https://deb.nodesource.com/setup_6.x","-o","nodesource_setup.sh"]
RUN ["bash","nodesource_setup.sh"]

RUN ["apt-get","install","-y","nodejs"]

COPY ./ /var/www/html

EXPOSE 80
EXPOSE 443

VOLUME /var/www/html
