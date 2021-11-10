# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hveiled <hveiled@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 17:12:50 by hveiled           #+#    #+#              #
#    Updated: 2021/03/18 12:42:32 by hveiled          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN	apk update && apk upgrade

RUN apk add influxdb supervisor

RUN	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY 	supervisor.conf /etc/supervisord.conf


COPY influxdb.conf /etc/influxdb.conf

RUN 	mkdir /etc/telegraf

RUN /usr/bin/telegraf -sample-config --input-filter docker \
	--output-filter influxdb > /etc/telegraf/telegraf.conf
# COPY	telegraf.conf ./etc/telegraf

COPY	setup.sh ./setup.sh	

RUN chmod +x ./setup.sh

EXPOSE	8086

CMD	./setup.sh

