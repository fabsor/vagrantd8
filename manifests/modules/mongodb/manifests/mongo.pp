class mongodb () {
  package {"mongodb": ensure => installed}
  package {"mongodb-server": ensure => installed}

  service {"mongodb":
    ensure => running,
    enable => true,
    require => Package['mongodb-server']
  }
  Package { require => Exec['apt-get update'] }
}
