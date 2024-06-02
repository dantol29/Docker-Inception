FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# COPY custom-config.cnf /etc/mysql/conf.d/

RUN mkdir /run/mysqld

RUN chmod 777 /run/mysqld

# Copy the custom entrypoint script into the image
COPY custom-entrypoint.sh /custom-entrypoint.sh

# Make the custom entrypoint script executable
RUN chmod +x /custom-entrypoint.sh

# Set the custom entrypoint script as the entrypoint for the container
ENTRYPOINT ["/custom-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--console"]