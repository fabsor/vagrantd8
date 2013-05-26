define php::pear_package($version="stable") {
  exec { "pear-install-${name}":
    command => "/usr/bin/pear install ${name}-${version}",
    require => Package['php-pear', 'build-essential', 'php5-dev'],
    unless => "/usr/bin/pear shell-test $name"
  }
}
