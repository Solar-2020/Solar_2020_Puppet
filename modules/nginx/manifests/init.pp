class nginx {
  nginx::conf { 'nginx': }
  nginx::conf { 'branch':
    pref => '/conf.d'
  }
  nginx::conf { 'cors': }

  package{ 'nginx':
    ensure => latest,
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    require   => Package['nginx'],
    subscribe => [
      Nginx::Conf['nginx'],
      Nginx::Conf['branch'],
      Nginx::Conf['cors'],
    ]

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
  -> file { '/usr/share/nginx/static':
    ensure => directory,
    mode   => '0770',
    owner  => 'nginx',
    group  => 'www'
  }
  -> file { '/usr/share/nginx/static/photos':
    ensure => directory,
    mode   => '0770',
    owner  => 'nginx',
    group  => 'www'
  }
  -> file { '/usr/share/nginx/static/files':
    ensure => directory,
    mode   => '0770',
    owner  => 'nginx',
    group  => 'www'
  }
  # a -> b means a before b
  # a ~> b means a before b; b subscribe a
}
