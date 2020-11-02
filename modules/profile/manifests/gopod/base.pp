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

  $go_dev_env = {
    sub      => 'dev',
    upstream => 'go_dev',
    port     => '9000',
    sub_ports   => {
      post      => '9101',
      auth      => '9401',
      group     => '9201',
      account   => '9501',
      interview => '9301'
    }
  }
  $go_env_list = [
    $go_dev_env
  ]

  class { 'nginx':
    go_backend_envs     => $go_env_list,
    go_default_upstream => 'go_dev',
    hostname            => 'nl-mail.ru',
    hostname_re         => 'nl-mail\.ru'
  }

  $commod_env_dev = [
    'AUTH_SERVICE_ADDRESS=http://develop.nl-mail.ru',
    'INTERVIEW_SERVICE=http://develop.nl-mail.ru',
    'GROUP_SERVICE_ADDRESS=http://develop.nl-mail.ru',
    'ACCOUNT_SERVICE_ADDRESS=http://develop.nl-mail.ru'
  ]

  # Service auth
  gobackend::service { 'auth_dev':
    port      => $go_dev_env['sub_ports']['auth'],
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
    port      => $go_dev_env['sub_ports']['post'],
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
      # $auth_env_dev,
  ]
  # gobackend::service { 'group_main':
  #   port    => '9200',
  #   service => 'group',
  #   branch  => 'main',
  #   env     => $group_env,
  # }
  gobackend::service { 'group_dev':
    port      => $go_dev_env['sub_ports']['group'],
    service   => 'group',
    branch    => 'dev',
    env       => concat($commod_env_dev, [
      "GROUP_DB_CONNECTION_STRING=${db_root}/groups?search_path=groups&sslmode=disable",
      # $auth_env_dev,
    ]),
    image_tag => $image_tag,
  }
  # ----------------------

  gobackend::service { 'account_dev':
    port      => $go_dev_env['sub_ports']['account'],
    service   => 'account',
    branch    => 'dev',
    env       => concat($commod_env_dev, [
      "ACCOUNT_DB_CONNECTION_STRING=${db_root}/users?search_path=users&sslmode=disable",
      # $auth_env_dev,
    ]),
    image_tag => $image_tag,
  }

  # Service interview
  $interview_env = [
      "INTERVIEW_DB_CONNECTION_STRING=${db_root}/posts?search_path=posts&sslmode=disable",
  ]
  # gobackend::service { 'interview_main':
  #   port    => '9300',
  #   service => 'interview',
  #   branch  => 'main',
  #   env     => $interview_env,
  # }
  gobackend::service { 'interview_dev':
    port      => $go_dev_env['sub_ports']['interview'],
    service   => 'interview',
    branch    => 'dev',
    env       => concat($commod_env_dev, [
      "INTERVIEW_DB_CONNECTION_STRING=${db_root}/posts?search_path=posts&sslmode=disable",
  ]),
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
