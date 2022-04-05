#!/bin/bash
service mysqld stop 
sed -i '12 i skip-grant-tables' /etc/my.cnf
service mysqld start
mysql <<EOF
flush privileges;
alter user 'root'@'localhost' identified by '123456';
exit
EOF
sed -i '/skip-grant-tables/d' /etc/my.cnf
#sed -i '12d' /etc/my.cnf
