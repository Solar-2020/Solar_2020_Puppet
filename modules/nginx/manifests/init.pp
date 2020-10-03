class nginx {
  nginx::conf { 'nginx': }
  nginx::conf { 'gobackend_dev':
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
    ]

  }
}
