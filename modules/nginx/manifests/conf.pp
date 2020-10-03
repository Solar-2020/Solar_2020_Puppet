define nginx::conf ( 
  String $root='/etc/nginx',
  String $pref='',
  String $owner='root', 
  String $group='root'
) {
  file { "${name}.conf":
    path => "${root}${pref}/${name}.conf",
    ensure => file,
    source => "puppet:///modules/nginx${pref}/${name}.conf",
    mode => '0644',
    owner => $owner,
    group => $group,
  }
}
