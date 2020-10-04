define users::sshuser(
  Array[String] $authorized_keys = [],
  $ensure = present,
  Boolean $managehome = true,
  Array[String] $groups = [],
){
  user { $name:
    ensure     => $ensure,
    managehome => $managehome,
    groups     => $groups,
  }

  ->file { "/home/${name}/.ssh":
    ensure => directory,
    owner  => $name,
    group  => $name,
    mode   => '0700',
    path   => "/home/${name}/.ssh"
  }

  ->file { "/home/${name}/.ssh/authorized_keys":
    ensure  => file,
    owner   => $name,
    group   => $name,
    mode    => '0600',
    path    => "/home/${name}/.ssh/authorized_keys",
    content => join($authorized_keys, "\n"),
  }

  # ssh_authorized_key { 'key':
  #   user => $name,
  #   type => 'rsa',
  #   key  => 'AAAA...GjjQfJ7',
  # }
  # create_resources( 'ssh_authorized_key', $authorized_keys, $key)
}
