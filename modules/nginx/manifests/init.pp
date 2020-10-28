class nginx {
  nginx::conf { 'nginx': }
  nginx::conf { 'branch':
    pref => '/conf.d'
  }
  nginx::conf { 'cors': }

  file {'/etc/nginx/conf.d/services':
      ensure => directory,
      mode   => '0770',
      owner  => 'nginx',
      group  => 'www'
  }
  -> nginx::conf { 'api':
    pref => '/conf.d/services'
  }
  -> nginx::conf { 'group':
    pref => '/conf.d/services'
  }
  -> nginx::conf { 'interview':
    pref => '/conf.d/services'
  }
  -> nginx::conf { 'auth':
    pref => '/conf.d/services'
  }

  package{ 'nginx':
    ensure => latest,
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
