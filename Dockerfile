FROM ubuntu:xenial

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_NO_INTERACTION 1

# Install tools
RUN apt-get update \
	&& apt-get -y install zip unzip \
		git build-essential curl \
		software-properties-common \ python-software-properties

# Install PHP
RUN add-apt-repository ppa:ondrej/php \
	&& apt-get update \
	&& apt-get -y install php7.0-cli php7.0-mbstring
	
# Install Composer
RUN curl -sS https://getcomposer.org/installer \
	  -o composer-setup.php \
	&& php composer-setup.php \
		--install-dir=/usr/local/bin \
		--filename=composer
	
# Install Node & NPM
RUN curl -sL https://deb.nodesource.com/setup_6.x \
	| -E bash - \
	&& apt-get -y install nodejs
	

	