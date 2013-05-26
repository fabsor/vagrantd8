define php::pear_channel() {
  exec { "pear-install-${name}":
    command => "/usr/bin/pear channel-discover ${name}",
    unless => "/usr/bin/pear channel-info $name",
    require => Package['php-pear', 'build-essential', 'php5-dev'],
  }
}
