class { 'systools': }
class { 'apache': }
class { 'php':
  development => true
}
php::pear_channel { "pear.drush.org": }

php::pear_package { "drush/drush":
  version => "6.0.0",
  require => Php::Pear_channel["pear.drush.org"]
}

class { 'postfix': }
class { 'mongodb': }

class { 'mysql':
  local_only     => true,
  hostname => "devbox.dev"
}

apache::vhost { "drupal": }
