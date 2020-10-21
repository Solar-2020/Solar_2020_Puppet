class profile::gopod::base {
  class { 'docker':
    version => 'latest',
  }

  $posts_envs =  [
      'POSTS_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/posts?search_path=posts&sslmode=disable',
      'UPLOAD_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/upload?search_path=upload&sslmode=disable',
      'FILE_PATH=/storage/files',
      'PHOTO_PATH=/storage/photos',
  ]

  gobackend::service { 'posts_master':
    port    => '9000',
    service => 'posts',
    branch  => 'master',
    env     => $posts_envs
  }

  gobackend::service { 'posts_dev':
    port    => '9100',
    service => 'posts',
    branch  => 'dev',
    env     => $posts_envs
  }

  gobackend::service { 'posts_predev':
    port    => '9101',
    service => 'posts',
    branch  => 'predev',
    env     => $posts_envs
  }

  gobackend::service { 'group_dev':
    port    => '9201',
    service => 'group',
    branch  => 'dev',
    env     => [
      'GROUP_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/groups?search_path=groups&sslmode=disable'
    ],
  }

  gobackend::service { 'interview_dev':
    port    => '9301',
    service => 'interview',
    branch  => 'dev',
    env     => [
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
