# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hveiled <hveiled@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 12:30:14 by hveiled           #+#    #+#              #
#    Updated: 2021/03/16 15:16:53 by hveiled          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN	apk update && apk upgrade

RUN apk add wget supervisor

RUN	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN	wget -P /tmp/ https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz && \
	tar -zxvf /tmp/grafana-7.4.0.linux-amd64.tar.gz

RUN	set -ex \
	addgroup -S grafana \
	adduser -S -G grafana grafana \
	apk add libc6-compat ca-certificates su-exec bash \
	apk add openrc

RUN apk --no-cache add ca-certificates wget && \
	wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
	apk add glibc-2.28-r0.apk

RUN mkdir /etc/telegraf

# COPY telegraf.conf ./etc/telegraf

COPY supervisor.conf ./etc/supervisord.conf

COPY grafana.db ./grafana-7.4.0/data/grafana.db

RUN ln -s grafana-7.4.0/bin/grafana-server ./grafana-server

COPY setup.sh ./setup.sh

# COPY telegraf.conf /etc/

RUN chmod +x ./setup.sh

EXPOSE 3000

CMD ./setup.sh
