adduser hveiled --disabled password

echo "hveiled:password" | chpasswd

mkdir /home/hveiled/ftp

chown nobody:nogroup /home/hveiled/ftp

chmod a-w /home/hveiled/ftp

mkdir /home/hveiled/ftp/files

chown hveiled:hveiled /home/hveiled/ftp/files

echo "vsftpd test file" | tee /home/hveiled/ftp/files/test.txt

echo "hveiled" | tee -a /etc/vsftpd/vsftpd.userlist

# supervisor start
/usr/bin/supervisord -c /etc/supervisord.conf
