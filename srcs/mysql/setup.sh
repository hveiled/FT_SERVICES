service mariadb setup

/etc/init.d/mariadb start && rc-update add mariadb default

echo "create database wordpress default character set utf8 collate utf8_unicode_ci;" | mysql
echo "grant all on wordpress.* to 'hveiled'@'%' identified by 'password';" | mysql
echo "flush privileges;" | mysql

mysql -u root wordpress < wordpress.sql

/etc/init.d/mariadb stop

/usr/bin/supervisord -c /etc/supervisord.conf