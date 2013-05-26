define apache::conf_file() {
  file { "/etc/apache2/${name}":
    owner  => root,
    group  => root,
    mode   => 0444,
    source => "puppet:///modules/apache/${name}",
  }
}
