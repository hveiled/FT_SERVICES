# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hveiled <hveiled@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 12:30:14 by hveiled           #+#    #+#              #
#    Updated: 2021/03/16 15:06:04 by hveiled          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add vsftpd openssl supervisor

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
				-keyout /etc/ssl/certs/vsftpd.key \
				-out /etc/ssl/private/vsftpd.crt \
				-subj "/C=RU/ST=Kazan/L=Kazan/O=Global_Security/OU=21school/CN=localhost"
				
# Setup vsftpd
COPY 	vsftpd.conf /etc/vsftpd/

COPY 	supervisor.conf /etc/supervisord.conf

# COPY 	telegraf.conf /etc/telegraf/

COPY	setup.sh ./setup.sh

RUN 	chmod +x ./setup.sh
		
EXPOSE	20 21 21009 21010

CMD		./setup.sh
 