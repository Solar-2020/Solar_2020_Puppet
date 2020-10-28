class profile::gopod::base {
  $hostname = 'http://nl-mail.ru'
  class { 'docker':
    version => 'latest',
  }

  if $::image_tag {
    $image_tag = $::image_tag
  } else {
    $image_tag = 'latest'
  }

  $db_root = $facts['db_root']

  $commod_env_dev = [
    'AUTH_SERVICE_ADDRESS=http://develop.nl-mail.ru',
    'INTERVIEW_SERVICE=http://develop.nl-mail.ru',
    'GROUP_SERVICE_ADDRESS=http://develop.nl-mail.ru',
    'ACCOUNT_SERVICE_ADDRESS=http://develop.nl-mail.ru'
  ]

  # Service auth
  $auth_port_dev='9401'
  gobackend::service { 'auth_dev':
    port      => $auth_port_dev,
    service   => 'auth',
    branch    => 'dev',
    env       => concat($commod_env_dev, [
      "AUTHORIZATION_DB_CONNECTION_STRING=${db_root}/auth?search_path=auth&sslmode=disable"
    ]),
    image_tag => $image_tag,
  }
  # $auth_env_dev = "AUTH_SERVICE_ADDRESS=http://develop.nl-mail.ru:${auth_port_dev}"
  #-----------------------

  # Service posts (main)
  $posts_envs =  [
    "POSTS_DB_CONNECTION_STRING=${db_root}/posts?search_path=posts&sslmode=disable",
    "UPLOAD_DB_CONNECTION_STRING=${db_root}/upload?search_path=upload&sslmode=disable",
    'FILE_PATH=/storage/files',
    'PHOTO_PATH=/storage/photos',
    $auth_env_dev,
  ]
  # gobackend::service { 'posts_master':
  #   port    => '9100',
  #   service => 'posts',
  #   branch  => 'master',
  #   env     => concat($posts_envs, [
  #     "INTERVIEW_SERVICE=${hostname}:9300"
  #   ])
  # }
  gobackend::service { 'posts_dev':
    port      => '9101',
    service   => 'posts',
    branch    => 'dev',
    env       => $commod_env_dev,
    image_tag => $image_tag,
  }
  # gobackend::service { 'posts_predev':
  #   port    => '9102',
  #   service => 'posts',
  #   branch  => 'predev',
  #   env     => concat($posts_envs, [
  #     "INTERVIEW_SERVICE=${hostname}:9301"
  #   ])
  # }
  # ----------------------

  # Service group
  $group_env = [
      "GROUP_DB_CONNECTION_STRING=${db_root}/groups?search_path=groups&sslmode=disable",
      $auth_env_dev,
  ]
  # gobackend::service { 'group_main':
  #   port    => '9200',
  #   service => 'group',
  #   branch  => 'main',
  #   env     => $group_env,
  # }
  gobackend::service { 'group_dev':
    port      => '9201',
    service   => 'group',
    branch    => 'dev',
    env       => concat($commod_env_dev, $group_env),
    image_tag => $image_tag,
  }
  # ----------------------

  # Service interview
  $interview_env = [
      "INTERVIEW_DB_CONNECTION_STRING=${db_root}/posts?search_path=posts&sslmode=disable",
      # $auth_env_dev
  ]
  # gobackend::service { 'interview_main':
  #   port    => '9300',
  #   service => 'interview',
  #   branch  => 'main',
  #   env     => $interview_env,
  # }
  gobackend::service { 'interview_dev':
    port      => '9301',
    service   => 'interview',
    branch    => 'dev',
    env       => concat($commod_env_dev, $interview_env),
    image_tag => $image_tag,
  }
  # ----------------------

  # Cron jobs
  cron { 'docker_clear':
    command => 'sudo /bin/docker container prune -f && sudo /bin/docker image prune -a -f',
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
