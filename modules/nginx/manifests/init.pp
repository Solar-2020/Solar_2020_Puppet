class nginx {
  nginx::conf { 'nginx': }
  nginx::conf { 'gobackend_dev':
    pref => "/conf.d"
  }
  nginx::conf { 'static':
    pref => "/conf.d"
  }

  package{ 'nginx':
    ensure => latest,
  }

  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx'],
    subscribe => [
      Nginx::Conf['nginx'],
      Nginx::Conf['gobackend_dev'],
      Nginx::Conf['static'],
    ]

  }

  file {'/usr/share/nginx/html':
    path => '/usr/share/nginx/html',
    ensure => directory,
    mode => '0770',
    owner => 'nginx',
    group => 'www'
  }
  file {'/home/deploy/html':
    path => '/home/deploy/html',
    ensure => link,
    mode => '0770',
    owner => 'deploy',
    group => 'www',
    require => File['/usr/share/nginx/html'],
  }
}
