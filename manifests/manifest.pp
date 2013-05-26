class { 'systools': }
class { 'apache': }
class { 'php':
  development => true
}
php::pear_package { "drush":
  version => "6.0.0"
}

class { 'postfix': }
class { 'mongodb': }

class { 'mysql':
  local_only     => true,
  hostname => "devbox.dev"
}

apache::vhost { "drupal": }
