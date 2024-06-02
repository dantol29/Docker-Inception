<?php
// MySQL database credentials
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );
define( 'DB_USER', getenv('WORDPRESS_DB_USER') );
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );

// Database charset
define( 'DB_CHARSET', 'utf8' );

// Database collation
define( 'DB_COLLATE', '' );

// Authentication unique keys and salts
define( 'AUTH_KEY',         getenv('WORDPRESS_AUTH_KEY') );
define( 'SECURE_AUTH_KEY',  getenv('WORDPRESS_SECURE_AUTH_KEY') );
define( 'LOGGED_IN_KEY',    getenv('WORDPRESS_LOGGED_IN_KEY') );
define( 'NONCE_KEY',        getenv('WORDPRESS_NONCE_KEY') );
define( 'AUTH_SALT',        getenv('WORDPRESS_AUTH_SALT') );
define( 'SECURE_AUTH_SALT', getenv('WORDPRESS_SECURE_AUTH_SALT') );
define( 'LOGGED_IN_SALT',   getenv('WORDPRESS_LOGGED_IN_SALT') );
define( 'NONCE_SALT',       getenv('WORDPRESS_NONCE_SALT') );

// WordPress database table prefix
$table_prefix = 'wp_';

// Enable debug mode for troubleshooting
define( 'WP_DEBUG', false );

// Absolute path to the WordPress directory
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(FILE) . '/');

// Sets up WordPress vars and included files
require_once( ABSPATH . 'wp-settings.php' );