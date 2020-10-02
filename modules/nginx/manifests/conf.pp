define nginx::conf (
  String $name = $title, 
  String $root='/etc/nginx',
  String $owner='nginx', 
  String $group='nginx'
) {
  file { "${name}.conf":
    path => "${root}/${name}.conf",
    ensure => file,
    source => "puppet:///modules/nginx/${name}.conf",
    mode => 0644,
    owner => $owner,
    group => $group,
  }
}
