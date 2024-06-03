FROM debian:11

ARG MYSQL_DATABASE
ARG MYSQL_PASSWORD
ARG MYSQL_USER

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_USER=$MYSQL_USER

RUN echo -e "$MYSQL_USER"

RUN apt-get update && apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /run/mysqld

RUN chmod 777 /run/mysqld

EXPOSE 3306

RUN mysqld --bind-address=0.0.0.0 & \
    sleep 5 && \
    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" && \
    mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
    mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" && \
    mysql -e "FLUSH PRIVILEGES;" && \
    mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}2'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
    mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '${MYSQL_USER}2'@'%';" && \
    mysql -e "FLUSH PRIVILEGES;" && \
    mysqladmin shutdown

CMD ["mysqld", "--bind-address=0.0.0.0"]