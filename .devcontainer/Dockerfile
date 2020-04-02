FROM wordpress:5.4

#use PHP dev ini
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

#Add some needed tools
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends git less ssh-client; \
	rm -rf /var/lib/apt/lists/*


# Add xDebug
RUN pecl install xdebug-2.8.1 \
	  && docker-php-ext-enable xdebug

RUN echo "[XDebug]\nxdebug.remote_enable = 1\nxdebug.remote_autostart = 1" > $PHP_INI_DIR/conf.d/xdebug.ini

#install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

#add vscode user
RUN useradd -ms /bin/bash vscode \
		&& usermod -aG www-data vscode

WORKDIR /home/vscode

#WP-CLI autocomplete
RUN curl -O https://raw.githubusercontent.com/wp-cli/wp-cli/v2.4.0/utils/wp-completion.bash \ 
		&& echo '. $HOME/wp-completion.bash' >> .bashrc

#install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
		&& php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
#install & configure wordpress
RUN wp core download