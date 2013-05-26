class apache (
  # A list of modules to have enabled.
  $modules = [
    'rewrite',
    'headers',
  ],
  # A set of common configuration files. These files can be replaced
  # by removing them from this array.
  $conf_files = [
    'apache2.conf',
    'conf.d/charset',
    'conf.d/default',
    'conf.d/log',
    'conf.d/security',
    'conf.d/ssl',
    'conf.d/tweaks',
    'conf.d/headers',
    'httpd.conf',
  ],
  # Ports
  $port = 80,
  $port_ssl = 443
) {

  package { 'apache2':
    ensure => installed,
  }

  package { 'apache2-mpm-prefork':
    ensure => installed,
    require => Package['apache2'],
  }

  service { apache2:
    enable  => true,
    ensure  => running,
    require => Package['apache2'],
  }

  apache::conf_file { $conf_files:
    require => Package['apache2'],
  }
  file { "/etc/apache2/sites-enabled/000-default":
    ensure => absent,
    require => Package['apache2'],
    notify => Service['apache2']
  }

  file { "/etc/apache2/sites-enabled/monitcheck.vhost":
    owner => root,
    group => root,
    mode  => 0444,
    source => 'puppet:///modules/apache/monitcheck.vhost',
    require => Package['apache2'],
    notify  => Service['apache2']
  }

  file { "/etc/apache2/ports.conf":
    owner  => root,
    group  => root,
    mode   => 0444,
    content => template("apache/ports.conf.erb"),
    notify => Service['apache2']
  }

  apache::module { $modules:
    require => Package['apache2'],
  }
  # Make sure apt-get has run.
  Package { require => Exec['apt-get update'] }
}
