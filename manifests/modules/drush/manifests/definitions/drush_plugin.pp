define drush::plugin($plugin, $version, $destination = '/usr/share/drush/commands', $user = 'root') {
  exec { "install-drush-plugin-$plugin":
    cwd => $destination,
    command => "/opt/drush/drush dl --destination=$destination ${plugin}-${version}",
    creates => "$destination/$plugin",
    require => [Exec["drush install"]],
    user => $user,
  }
}
