# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hveiled <hveiled@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 12:30:14 by hveiled           #+#    #+#              #
#    Updated: 2021/03/16 15:06:44 by hveiled          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add nginx supervisor wget

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN 	adduser -D -g 'www' www

RUN		mkdir /www

RUN		chown -R www:www /var/lib/nginx

RUN 	chown -R www:www /www

COPY	nginx.conf /etc/nginx

COPY 	supervisor.conf /etc/supervisord.conf

# COPY 	telegraf.conf /etc/telegraf/

COPY	setup.sh /tmp/setup.sh

RUN 	chmod +x /tmp/setup.sh

RUN 	mkdir -p /run/nginx

RUN 	mkdir -p /run/php


#PHP7 Installation
RUN 	apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

COPY 	php7.sh /etc/profile.d/php7.sh

RUN 	chmod +x /etc/profile.d/php7.sh

COPY	phpinfo.php /www/

RUN		apk add tzdata

RUN 	sh -c '/etc/profile.d/php7.sh'

#WORDPRESS Installation

RUN		wget -P /www https://wordpress.org/latest.tar.gz && \
		tar -C /www -xvf /www/latest.tar.gz && \
		rm /www/latest.tar.gz

COPY	wp-config.php /www/wordpress/wp-config.php

EXPOSE	5050
		
CMD		/tmp/setup.sh