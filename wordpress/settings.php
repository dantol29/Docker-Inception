<?php
// MySQL database credentials
define( 'DB_NAME', 'inceptiondb' );
define( 'DB_USER', 'dtolmaco' );
define( 'DB_PASSWORD', 'dantol2004' );
define( 'DB_HOST', 'mariadb' );

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