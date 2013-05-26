define apache::vhost(
  $hostname = false,
  $allow_override = true,
  $document_root = '/var/www',
  $aliases = false
  ) {
  file { "/etc/apache2/sites-enabled/${name}":
    owner  => root,
    group  => root,
    mode   => 0444,
    content => template("apache/vhost.erb"),
    notify => Service['apache2'],
    require => Package['apache2']
  }
}

