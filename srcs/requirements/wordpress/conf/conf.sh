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
fi

if wp user list --allow-root | grep -q $WP_GUEST_USER; then
    echo "User exists"
else
    wp user create $WP_GUEST_USER $WP_GUEST_EMAIL --role=editor --user_pass=$WP_GUEST_PASSWORD --allow-root
fi

# Execute the CMD
exec "$@"