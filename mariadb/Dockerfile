FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /run/mysqld

RUN chmod 777 /run/mysqld

EXPOSE 3306

RUN mysqld --bind-address=0.0.0.0 & \
    sleep 5 && \
    mysql -e "CREATE DATABASE IF NOT EXISTS inceptiondb;" && \
    mysql -e "CREATE USER IF NOT EXISTS 'dtolmaco'@'%' IDENTIFIED BY 'dantol2004';" && \
    mysql -e "GRANT ALL PRIVILEGES ON inceptiondb.* TO 'dtolmaco'@'%';" && \
    mysql -e "FLUSH PRIVILEGES;" && \
    mysqladmin shutdown

CMD ["mysqld", "--bind-address=0.0.0.0"]