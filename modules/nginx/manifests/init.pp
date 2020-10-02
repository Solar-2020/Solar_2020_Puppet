class nginx {
  nginx::conf { 'nginx': }

  package{ 'nginx':
    ensure => latest,
  }

  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx'],
    subscribe => [
      Nginx::Conf['nginx'],
    ]

  }
}
