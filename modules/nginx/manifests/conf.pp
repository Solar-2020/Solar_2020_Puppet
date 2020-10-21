define nginx::conf (
  String $root='/etc/nginx',
  String $pref='',
  String $owner='root',
  String $group='root'
) {
  file { "${name}.conf":
    ensure => file,
    path   => "${root}${pref}/${name}.conf",
    source => "puppet:///modules/nginx${pref}/${name}.conf",
    mode   => '0644',
    owner  => $owner,
    group  => $group,
    notify => Service['nginx']
  }
}
