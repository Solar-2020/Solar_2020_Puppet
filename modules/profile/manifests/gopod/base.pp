class profile::gopod::base {
  class { 'docker':
    version => 'latest',
  }

  class { 'gobackend::master':
    require => Class['docker'],
    port    => '9000',
  }

  class { 'gobackend::dev':
    require => Class['docker'],
    port    => '9100',
  }

  class { 'gobackend::predev':
    require => Class['docker'],
    port    => '9101',
  }

  cron { 'docker_clear':
    command => '/bin/docker container prune -f && /bin/docker image prune -f',
    user    => 'deploy',
    hour    =>absent,
    minute  => '*/30',
  }
}
