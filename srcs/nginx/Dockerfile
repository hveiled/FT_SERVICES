# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hveiled <hveiled@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 12:30:14 by hveiled           #+#    #+#              #
#    Updated: 2021/03/16 15:06:30 by hveiled          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add nginx openssl openssh supervisor

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN 	adduser -D -g 'www' www

RUN		mkdir /www

RUN		chown -R www:www /var/lib/nginx

RUN 	chown -R www:www /www

COPY	index.html /www/

COPY	nginx.conf /etc/nginx

COPY 	supervisor.conf /etc/supervisord.conf

# COPY 	telegraf.conf /etc/telegraf/

RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-keyout /etc/ssl/private/hveiled.key \
			-out /etc/ssl/certs/hveiled.crt \
			-subj "/C=RU/ST=RT/L=Kazan/O=Global_Security/OU=21school/CN=hveiled"

RUN 	sed -i 's/#PermitRootLogin without-password/#PermitRootLogin yes/' /etc/ssh/sshd_config

RUN 	/usr/bin/ssh-keygen -A

RUN  	ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

COPY	start.sh /tmp/start.sh

RUN 	chmod +x /tmp/start.sh

RUN 	mkdir -p /run/nginx
		
EXPOSE	80 443 22

CMD		/tmp/start.sh

 