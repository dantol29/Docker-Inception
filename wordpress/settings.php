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

// WordPress database table prefix
$table_prefix = 'wp_';

// Enable debug mode for troubleshooting
define( 'WP_DEBUG', false );

// Absolute path to the WordPress directory
define('ABSPATH', dirname(FILE) . '/');

// Sets up WordPress vars and included files
require_once( ABSPATH . 'wp-settings.php' );