#!/bin/bash
set -e

# Navigate to the WordPress directory
cd /var/www/html

# Create wp-config.php with environment variables
if [ ! -f wp-config.php ]; then
    echo "creating file"
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root
fi

# Install WordPress
if ! wp core is-installed --allow-root; then
    echo "creating website"
    wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create guest guest@gmail.com --role=editor --user_pass=dantol2004 --allow-root
fi

# Execute the CMD
exec "$@"