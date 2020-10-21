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

  class { 'gobackend::group::dev':
    require => Class['docker'],
    port    => '9201',
  }

  # class { 'gobackend::interview::dev':
  #   require => Class['docker'],
  #   port    => '9301',
  # }
  gobackend::service { 'interview':
    port   => '9301',
    branch => 'dev',
    env    => [
      'INTERVIEW_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/posts?search_path=posts&sslmode=disable'
    ],
  }

  cron { 'docker_clear':
    command => 'sudo /bin/docker container prune -f && sudo /bin/docker image prune -f',
    user    => 'deploy',
    hour    =>absent,
    minute  => '*/30',
  }

  cron { 'tsm_kill':
    command => 'sudo kill $(pgrep tsm -f)',
    user    => 'deploy',
    minute  => '*/1',
  }
}
