#!/bin/bash

# Run init.sql script if it exists
if [ -f /docker-entrypoint-initdb.d/init.sql ]; then
    echo "Initializing database with init.sql script"
    mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < /docker-entrypoint-initdb.d/init.sql
fi

# Start the MySQL server using the default entrypoint script
exec /entrypoint.sh "$@"