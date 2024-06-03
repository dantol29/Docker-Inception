#!/bin/bash

service mysql start 


echo "CREATE DATABASE IF NOT EXISTS inceptiondb ;" > db1.sql
echo "CREATE USER IF NOT EXISTS 'dtolmaco'@'%' IDENTIFIED BY 'dantol2004' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON inceptiondb.* TO 'dtolmaco'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld --bind-address=0.0.0.0