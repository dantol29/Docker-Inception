FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# COPY custom-config.cnf /etc/mysql/conf.d/

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--console"]