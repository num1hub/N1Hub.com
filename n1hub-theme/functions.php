<?php
/**
 * N1Hub Theme functions
 * @package n1hub
 */
if ( ! function_exists( 'n1hub_setup' ) ) {
  function n1hub_setup() {
    add_theme_support( 'wp-block-styles' );
    add_theme_support( 'responsive-embeds' );
    add_theme_support( 'editor-styles' );
    add_theme_support( 'custom-logo' );
    add_theme_support( 'title-tag' );
    add_theme_support( 'post-thumbnails' );
  }
}
add_action( 'after_setup_theme', 'n1hub_setup' );
function n1hub_enqueue() {
  wp_enqueue_style( 'n1hub-style', get_stylesheet_uri(), array(), '0.1.0' );
}
add_action( 'wp_enqueue_scripts', 'n1hub_enqueue' );


