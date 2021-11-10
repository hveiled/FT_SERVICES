# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hveiled <hveiled@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 12:30:14 by hveiled           #+#    #+#              #
#    Updated: 2021/03/16 15:06:25 by hveiled          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add wget mysql mysql-client mariadb openrc supervisor

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN 	rc-status

RUN 	touch /run/openrc/softlevel

RUN		mkdir -p /run/mysqld

COPY 	supervisor.conf /etc/supervisord.conf

# COPY 	telegraf.conf /etc/telegraf/

COPY	my.cnf /etc/my.cnf

COPY	setup.sh ./setup.sh

RUN 	chmod +x ./setup.sh

COPY 	wordpress.sql ./wordpress.sql
		
EXPOSE	3306

CMD		./setup.sh
 