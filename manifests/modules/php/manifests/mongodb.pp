class php::mongo () {
  php::pecl_package { "mongo": }

  file { "/etc/php5/conf.d/mongo.ini":
    owner  => root,
    group  => root,
    mode   => 0444,
    content => "extension=mongo.so",
    require => php::pecl_package['mongo'],
  }

}
