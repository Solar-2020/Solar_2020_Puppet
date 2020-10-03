class nginx {
  nginx::conf { 'nginx': }
  nginx::conf { 'gobackend_dev':
    pref => '/conf.d'
  }
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
      Nginx::Conf['gobackend_dev'],
      Nginx::Conf['branch'],
      Nginx::Conf['cors'],
    ]

  }

  file {'/usr/share/nginx/html':
    ensure => directory,
    path   => '/usr/share/nginx/html',
    mode   => '0770',
    owner  => 'nginx',
    group  => 'www'
  }
  file {'/home/deploy/html':
    ensure  => link,
    path    => '/home/deploy/html',
    mode    => '0770',
    owner   => 'deploy',
    group   => 'www',
    require => File['/usr/share/nginx/html'],
  }
}
