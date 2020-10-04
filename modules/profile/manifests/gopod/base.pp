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
    port    => '9101',fs
  }

  cron { 'docker_clear':
    command => 'sudo /bin/docker container prune -f && sudo /bin/docker image prune -f',
    user    => 'deploy',
    hour    =>absent,
    minute  => '*/30',
  }
}
