class postfix {
  package { "postfix":
    ensure => installed,
  }
  Package { require => Exec['apt-get update'] }
}
