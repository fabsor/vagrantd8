class php (
  $packages = [
    'php5',
    'php5-cli',
    'php5-common',
    'php5-mysql',
    'php5-gd',
    'php5-curl',
    'php5-dev',
    'php5-mcrypt',
    'php-pear',
    'php5-sqlite',
    'build-essential',
    'php5-ldap',
    'libapache2-mod-php5',
  ],
  $new_packages = [
    'php5-intl',
    'php-apc'
  ],
  $conf_files = [
    'apache2/php.ini',
    'cli/php.ini',
    'conf.d/apc.ini',
    'conf.d/curl.ini',
    'conf.d/gd.ini',
    'conf.d/memcache.ini',
    'conf.d/mysqli.ini',
    'conf.d/mysql.ini',
    'conf.d/pdo.ini',
    'conf.d/pdo_mysql.ini',
    'conf.d/security',
    'conf.d/uploadprogress.ini',
  ],
  $pecl_packages = [
    'uploadprogress',
  ],
  $old_pecl = [
    'apc'
  ],
  $development = false,
  $legacy = false
) {
  if $legacy {
    file { "/etc/apt/sources.list.d/hardy.list":
      owner => root,
      group => root,
      mode => 0444,
      source => "puppet:///modules/php/hardy.list",
    }
    file { "/etc/apt/preferences.d/php":
      owner => root,
      group => root,
      mode => 0444,
      content => template("php/php.pin.erb"),
    }
    exec { "php-apt-update":
      command => "/usr/bin/apt-get update",
      require => [File["/etc/apt/sources.list.d/hardy.list"], File["/etc/apt/preferences.d/php"]]
    }
    package { $packages:
      require => Exec["php-apt-update"]
    }
    php::pecl_package { $old_pecl: }
  }
  else {
    package { $packages:
      ensure => installed,
    }
    package { $new_packages:
      ensure => installed,
    }
  }
  php::pecl_package { $pecl_packages: }

  if $development {
    php::pecl_package { "xdebug": }
    php::conf_file { ["conf.d/dev.ini"]: }
  }
  php::conf_file { $conf_files:
    require => Package['php5']    
  }
  Package { require => Exec['apt-get update'] }
}
