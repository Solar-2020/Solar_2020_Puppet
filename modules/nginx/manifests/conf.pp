define nginx::conf ( 
  String $root='/etc/nginx',
  String $owner='root', 
  String $group='root'
) {
  file { "${name}.conf":
    path => "${root}/${name}.conf",
    ensure => file,
    source => "puppet:///modules/nginx/${name}.conf",
    mode => '0644',
    owner => $owner,
    group => $group,
  }
}
