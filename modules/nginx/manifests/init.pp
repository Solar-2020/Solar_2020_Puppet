class nginx (
  $go_backend_envs,
  $go_default_upstream,
  $hostname,
  $hostname_re
){
  # nginx::conf { 'nginx': }
  # nginx::conf { 'branch':
  #   pref => '/conf.d'
  # }
  nginx::conf { 'cors': }
  nginx::conf { 'proxy_pass_backend': }

  ->file { 'nginx.conf':
    ensure  => file,
    path    => '/etc/nginx/nginx.conf',
    content => template('nginx/nginx.conf.erb'),
    mode    => '0644',
    owner   => 'nginx',
    group   => 'www',
    notify  => Service['nginx']
  }

  file { 'conf.d/branch.conf':
    ensure  => file,
    path    => '/etc/nginx/conf.d/branch.conf',
    content => template('nginx/conf.d/branch.conf.erb'),
    mode    => '0644',
    owner   => 'nginx',
    group   => 'www',
    notify  => Service['nginx']
  }

  $go_backend_envs.each |$env| {
    file { "/etc/nginx/conf.d/api_${$env['sub']}.conf":
      ensure  => file,
      content => template('nginx/conf.d/api.conf.erb'),
      mode    => '0644',
      owner   => 'nginx',
      group   => 'www',
      notify  => Service['nginx']
    }
  }


  # file {'/etc/nginx/conf.d/services':
  #     ensure => directory,
  #     mode   => '0770',
  #     owner  => 'nginx',
  #     group  => 'www'
  # }
  # -> nginx::conf { 'api':
  #   pref => '/conf.d/services'
  # }
  # -> nginx::conf { 'group':
  #   pref => '/conf.d/services'
  # }
  # -> nginx::conf { 'interview':
  #   pref => '/conf.d/services'
  # }
  # -> nginx::conf { 'auth':
  #   pref => '/conf.d/services'
  # }
  # -> nginx::conf { 'account':
  #   pref => '/conf.d/services'
  # }

  package{ 'nginx':
    ensure => '1.19.4',
  }

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx']
  }

  # from here nginx serves
  file {'/usr/share/nginx/html':
    ensure => directory,
    path   => '/usr/share/nginx/html',
    mode   => '0770',
    owner  => 'nginx',
    group  => 'www'
  }

  # here github loads files
  -> file {'/home/deploy/html':
    ensure => link,
    path   => '/home/deploy/html',
    mode   => '0770',
    owner  => 'deploy',
    group  => 'www',
  }
  -> file { '/usr/share/nginx/storage':
    ensure => directory,
    mode   => '0777',
    owner  => 'nginx',
    group  => 'www'
  }
  -> file { '/usr/share/nginx/storage/photos':
    ensure => directory,
    mode   => '0777',
    owner  => 'nginx',
    group  => 'www'
  }
  -> file { '/usr/share/nginx/storage/files':
    ensure => directory,
    mode   => '0777',
    owner  => 'nginx',
    group  => 'www'
  }
  # a -> b means a before b
  # a ~> b means a before b; b subscribe a
}
