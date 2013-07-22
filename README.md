# Drupal 8 vagrant box

This is vagrant environment is suited for D8 development.

# Setting it up
run "make core", this will set you up with the lasted version D8 core and put it in
the "web" directory.

# Setting up vagrant
Run 'vagrant up'. Vagrant will need sudo permissions for your local user in order to set up NFS shares properly.

# Getting it up and running.
Go to 192.168.50.2, you should have a working D8 code base.


## Access and Credentials
* Access via browser to the web root is defined in the Vagrant file: 192.168.50.2, you can add this entry to <code>/etc/hosts</code>

Mac OS X GUI hint: [Hosts.prefpane](https://github.com/specialunderwear/Hosts.prefpane)

### MySQL
* host: 192.168.50.2
* user: root
* pass: password

### SSH
* host: 192.168.50.2
* user: vagrant
* pass: vagrant

## Setting up a drush alias to work with the vagrant box

Download the private vagrant ssh key [here](https://raw.github.com/mitchellh/vagrant/master/keys/vagrant), then create an alias in ~/.drush/aliases.drushrc.php:

    <?php
	$aliases['dev'] = array(
	  'root' => '/var/www',
	  'db-url' => 'mysql://root:password@localhost/db',
      'remote-host' => '192.168.50.2',
      'remote-user' => 'vagrant',
         'ssh-options' => '-i /path-to-your-key/vagrant',
	   );
	?>

