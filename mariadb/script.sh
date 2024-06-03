#!/bin/bash

# Start MySQL service
service mysql start

# Wait for MySQL to start
while ! mysqladmin ping -hlocalhost --silent; do
    sleep 1
done

# Create a new database
mysql -e "CREATE DATABASE inceptiondb;"

# Add a new user
mysql -e "CREATE USER 'dtolmaco'@'localhost' IDENTIFIED BY 'dantol2004';"

# Grant privileges to the new user
mysql -e "GRANT ALL PRIVILEGES ON inceptiondb.* TO 'dtolmaco'@'localhost';"

# Flush privileges
mysql -e "FLUSH PRIVILEGES;"

# Keep container running
exec "$@"