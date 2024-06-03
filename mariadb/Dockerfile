FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /run/mysqld

RUN chmod 777 /run/mysqld

COPY ./script.sh /

RUN chmod 777 ./script.sh

EXPOSE 3306

# CMD ["/script.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0"]