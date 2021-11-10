#!/bin/sh

minikube start --driver=virtualbox --cpus 4 --memory 4g --disk-size=50G --addons metallb --addons metrics-server --addons dashboard

eval $(minikube docker-env)

docker build -t nginx_image srcs/nginx
docker build -t wordpress_image srcs/wordpress
docker build -t mysql_image srcs/mysql
docker build -t phpmyadmin_image srcs/phpmyadmin
docker build -t ftps_image srcs/ftps
docker build -t grafana_image srcs/grafana
docker build -t influxdb_image srcs/influxdb

kubectl apply -f srcs/deploynent/metallb.yaml
kubectl apply -f srcs/deploynent/nginx.yaml
kubectl apply -f srcs/deploynent/mysql.yaml
kubectl apply -f srcs/deploynent/ftps.yaml
kubectl apply -f srcs/deploynent/phpmyadmin.yaml
kubectl apply -f srcs/deploynent/wordpress.yaml
kubectl apply -f srcs/deploynent/grafana.yaml
kubectl apply -f srcs/deploynent/influxdb.yaml

minikube dashboard