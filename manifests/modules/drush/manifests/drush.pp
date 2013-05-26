class drush () {
  package { 'drush':
    ensure => installed,
    require => Package['php5-cli'],
  }
}
