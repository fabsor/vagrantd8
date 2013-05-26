# Apache puppet module

This is an apache puppet module used by NodeOne.
It is built to work with debian-like systems and will not work with anything else.

# Installation
Put this module in your puppet modules directory.
You can then use it by invoking it in your scripts or wherever:

    class { 'apache': }

# Options

All config files are parameters to the apache class.
This means you can skip some of our default ocnfig by changing the array:

    class { 'apache':
      conf_files => [ 'apache.conf' ]
	  
The code above will exclude all default config files except apache.conf.

# Improvements

There are many improvements to make this module more generic.
That may or may not happen.
