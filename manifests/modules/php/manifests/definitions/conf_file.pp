define php::conf_file() {
  file { "/etc/php5/${name}":
    owner => root,
    group => root,
    mode => 0444,
    source => "puppet:///modules/php/${name}",
    require => Package[$php::packages]
  }
}
