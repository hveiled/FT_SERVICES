adduser hveiled

echo "hveiled:password" | chpasswd

/usr/bin/supervisord -c /etc/supervisord.conf
