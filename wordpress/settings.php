<?php
// MySQL database credentials
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );
define( 'DB_USER', getenv('WORDPRESS_DB_USER') );
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );

// // Database charset
// define( 'DB_CHARSET', 'utf8' );

// // Database collation
// define( 'DB_COLLATE', '' );

// WordPress database table prefix
$table_prefix = 'wp_';

// Enable debug mode for troubleshooting
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );

// Absolute path to the WordPress directory
if (! defined('ABSPATH') )
{
    define('ABSPATH', dirname(__DIR__) . '/');
}

// Sets up WordPress vars and included files
require_once( ABSPATH . 'wp-settings.php' );