# PHP puppet module
This puppet module installs PHP on a debian-like server.

# Installation
Put the module in your puppet modules directory.

# Customization

The PHP class has some parameters, described below:

    class { 'php':
	  # Alter the default set of PHP packages
	  # that are being installed.
	  packages => [ 'php5', 'php5-cli' ]
	  # Alter which default configuration
	  # files should be added.
	  conf_files => [ 'apache/php.ini']
	  # Turn on html errors and install
	  # neat stuff like XDEBUG
	  development => true
	  # Only use this with ubuntu.
	  # This pulls in the hardy repository
	  # and pins down all packages specified
	  # in the packages array.
	  # This means you will get php 5.2.
	  # May god have mercy on your soul.
	  legacy => true
	  
There is a handy definition for installing pecl packages:

    php::pecl_package { "xdebug":
	
	}
