<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', '10.96.0.50' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '*F37kdYC|+^-*F?|P.g4c%X[7elE7j)IEsqY0Wt/x*{sDH:bg^LwMB@l6p.1gPA9' );
define( 'SECURE_AUTH_KEY',  'k SPcTL.f3XnB.VwMX5MphSB-00%NN!i}tJqR6.JcgVAOfO}bZD3Ksw`6ynlUoyJ' );
define( 'LOGGED_IN_KEY',    '`Q:-YCOEEK$uJgLnqhxZidd#X<52veNKChMH%d^RJ*-,J4bC?g*pG(425Y3t!.Jg' );
define( 'NONCE_KEY',        '|t*#gzSf+a#G.X:Ca0/n WxRY K?8nNU9*=<7jr0QzJwPh>QY6OXCP_$u+~fPHp^' );
define( 'AUTH_SALT',        'OiUdKAoX/KEQaUZ.Ii&C(%3axAj^1~FK=}NjYGB*(0mFlFSy+sJC/M-my__PrR4.' );
define( 'SECURE_AUTH_SALT', 'l-mY{I`}CWE|2*gI6-JefPY}^#ot;4Xr{7hP5V~G`=%]8zU&N#Q8.u%2!8.z7L/M' );
define( 'LOGGED_IN_SALT',   '4lU[3f43b[am{XC%=w0TnhP=%OD<zu0|$$}Co86rz]<75TZU|8XaH(Iy#S,RzLRI' );
define( 'NONCE_SALT',       'U(t~Fm7k(:$>)NG4mg/6p5w71{06{P}Eq@`ol[gAE3ZY)o^b0W(M>YMo2.gY>z=m' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
