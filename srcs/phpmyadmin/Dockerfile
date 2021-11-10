# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hveiled <hveiled@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 12:30:14 by hveiled           #+#    #+#              #
#    Updated: 2021/03/16 15:06:35 by hveiled          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add nginx supervisor phpmyadmin

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY 	supervisor.conf /etc/supervisord.conf

# COPY 	telegraf.conf /etc/telegraf/

COPY	nginx.conf /etc/nginx

##################

RUN 	adduser -D -g 'www' www

RUN		mkdir /www

RUN		chown -R www:www /var/lib/nginx

RUN 	chown -R www:www /www

##################

RUN 	mkdir -p /run/nginx/php

# RUN 	mkdir -p /run/php
		
RUN		apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
# COPY 	php7.sh /etc/profile.d/php7.sh

# RUN 	chmod +x /etc/profile.d/php7.sh

# RUN 	/usr/bin/mysql_install_db --user=mysql

# RUN 	/etc/init.d/mysql start && rc-update add mysql default

# RUN		/usr/bin/mysqladmin -u root password 'password'

# RUN 	mkdir -p /usr/share/webapps/

RUN 	chmod -R 777 /usr/share/webapps/

RUN		ln -s /usr/share/webapps/phpmyadmin/ /www/phpmyadmin	

COPY	nginx.conf /etc/nginx/nginx.conf

# COPY	index.html /www

# COPY	phpinfo.php /www

COPY	config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php

COPY	setup.sh ./setup.sh

RUN 	chmod +x ./setup.sh
		
EXPOSE	5000

CMD		./setup.sh
 