class profile::gopod::base {
  $hostname = 'pay-together.ru'
  class { 'docker':
    version => 'latest',
  }

  if $::image_tag {
    $image_tag = $::image_tag
  } else {
    $image_tag = 'latest'
  }

  $db_root = $facts['db_root']
  $payment_client_id = $facts['client_id']
  $invite_mail_password = $facts['invite_mail_pwd']
  $jwt_payment_secret = $facts['jwt_payment_secret']
  # $payment_server_secret = $facts['server_secret']

  # Описываем зоны, для которых генерим конфиг (прод, дев и тд)

  # dev
  $go_dev_env = {
    sub      => 'develop',
    upstream => 'go_dev',
    port     => '9000',
    sub_ports   => {
      post      => '9101',
      auth      => '9401',
      group     => '9201',
      account   => '9501',
      interview => '9301',
      payments  => '9601'
    }
  }
  $go_master_env = {
    sub      => 'main',
    upstream => 'go_main',
    port     => '8000',
    sub_ports   => {
      post      => '8101',
      auth      => '8401',
      group     => '8201',
      account   => '8501',
      interview => '8301',
      payments  => '8601'
    }
  }
  $go_env_list = [
    $go_dev_env,
    $go_master_env
  ]

  class { 'nginx':
    go_backend_envs     => $go_env_list,
    go_default_upstream => 'go_main',
    hostname            => 'pay-together.ru',
    hostname_re         => 'pay-together\.ru',
    hostnames           => [
      {
        name => 'pay-together.ru',
        re   => 'pay-together\.ru'
      },
      {
        name => 'nl-mail.ru',
        re   => 'nl-mail\.ru'
      },
    ]
  }

  $dev_host = "develop.${hostname}"
  $dev_url  = "https://${dev_host}"

  $commod_env_dev = [
    'AUTH_SERVICE_ADDRESS=http://develop.pay-together.ru',
    'INTERVIEW_SERVICE=http://develop.pay-together.ru',
    'GROUP_SERVICE_ADDRESS=http://develop.pay-together.ru',
    'ACCOUNT_SERVICE_ADDRESS=http://develop.pay-together.ru',

    "AUTH_SERVICE_HOST=${dev_host}",
    "GROUP_SERVICE_HOST=${dev_host}",
    "ACCOUNT_SERVICE_HOST=${dev_host}",
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
  #-----------------------

  # Service posts (main)
  $posts_envs =  [
    "POSTS_DB_CONNECTION_STRING=${db_root}/posts?search_path=posts&sslmode=disable",
    "UPLOAD_DB_CONNECTION_STRING=${db_root}/upload?search_path=upload&sslmode=disable",
    'FILE_PATH=/storage/files',
    'PHOTO_PATH=/storage/photos',
  ]

  gobackend::service { 'posts_dev':
    port      => $go_dev_env['sub_ports']['post'],
    service   => 'posts',
    branch    => 'dev',
    env       => $commod_env_dev,
    image_tag => $image_tag,
  }

  # Service group
  $group_dev_env = [
      "GROUP_DB_CONNECTION_STRING=${db_root}/groups?search_path=groups&sslmode=disable",
      "INVITE_GROUP_PREFIX_ADDRESS=${dev_url}/welcome",
      "INVITE_LETTERS_PASSWORD=${invite_mail_password}"
  ]
  gobackend::service { 'group_dev':
    port      => $go_dev_env['sub_ports']['group'],
    service   => 'group',
    branch    => 'dev',
    env       => concat($commod_env_dev, $group_dev_env),
    image_tag => $image_tag,
  }
  # ----------------------

  gobackend::service { 'account_dev':
    port      => $go_dev_env['sub_ports']['account'],
    service   => 'account',
    branch    => 'dev',
    env       => concat($commod_env_dev, [
      "ACCOUNT_DB_CONNECTION_STRING=${db_root}/users?search_path=users&sslmode=disable",
    ]),
    image_tag => $image_tag,
  }

  # Service interview
  $interview_env = [
      "INTERVIEW_DB_CONNECTION_STRING=${db_root}/interviews?search_path=interviews&sslmode=disable",
  ]
  gobackend::service { 'interview_dev':
    port      => $go_dev_env['sub_ports']['interview'],
    service   => 'interview',
    branch    => 'dev',
    env       => concat($commod_env_dev, [
      "INTERVIEW_DB_CONNECTION_STRING=${db_root}/interviews?search_path=interviews&sslmode=disable",
  ]),
    image_tag => $image_tag,
  }

  $payment_env = [
    "PAYMENT_DB_CONNECTION_STRING=${db_root}/payment?search_path=payment&sslmode=disable",
    "MONEY_CLIENT_ID=${payment_client_id}",
    "JWT_PAYMENT_TOKEN_SECRET=${jwt_payment_secret}",
    'PAYMENT_REDIRECT_COOKIE_LIFETIEME=172800'
  ]

  gobackend::service { 'payments_dev':
    port      => $go_dev_env['sub_ports']['payments'],
    service   => 'payments',
    branch    => 'dev',
    env       => concat($commod_env_dev, $payment_env, [
      "DOMAIN_NAME=${dev_host}",
      # "SERVER_SECRET=${payment_server_secret",
      "MONEY_FAIL_URL=${dev_url}/pay/error",
      "SUCCESS_PAYMENT_REDIRECT=${dev_url}/group/%d",
    ]),
    image_tag => $image_tag,
  }
  # ----------------------

  # PROD

  $commod_env_prod = [
    'AUTH_SERVICE_ADDRESS=https://pay-together.ru',
    'INTERVIEW_SERVICE=https://pay-together.ru',
    'GROUP_SERVICE_ADDRESS=https://pay-together.ru',
    'ACCOUNT_SERVICE_ADDRESS=https://pay-together.ru',

    "AUTH_SERVICE_HOST=${hostname}",
    "GROUP_SERVICE_HOST=${hostname}",
    "ACCOUNT_SERVICE_HOST=${hostname}",
  ]

  # Service auth
  gobackend::service { 'auth':
    port      => $go_master_env['sub_ports']['auth'],
    service   => 'auth',
    branch    => 'main',
    env       => concat($commod_env_prod, [
      "AUTHORIZATION_DB_CONNECTION_STRING=${db_root}/auth?search_path=auth&sslmode=disable"
    ]),
    image_tag => $image_tag,
  }
  #-----------------------

  # Service posts (main)
  # $posts_envs =  [
  #   "POSTS_DB_CONNECTION_STRING=${db_root}/posts?search_path=posts&sslmode=disable",
  #   "UPLOAD_DB_CONNECTION_STRING=${db_root}/upload?search_path=upload&sslmode=disable",
  #   'FILE_PATH=/storage/files',
  #   'PHOTO_PATH=/storage/photos',
  # ]

  gobackend::service { 'posts':
    port      => $go_master_env['sub_ports']['post'],
    service   => 'posts',
    branch    => 'master',
    env       => $commod_env_prod,
    image_tag => $image_tag,
  }

  # Service group
  # $group_env = [
  #     "GROUP_DB_CONNECTION_STRING=${db_root}/groups?search_path=groups&sslmode=disable",
  # ]
  $group_env = [
      "GROUP_DB_CONNECTION_STRING=${db_root}/groups?search_path=groups&sslmode=disable",
      "INVITE_GROUP_PREFIX_ADDRESS=https://${hostname}/welcome",
      "INVITE_LETTERS_PASSWORD=${invite_mail_password}"
  ]
  gobackend::service { 'group':
    port      => $go_master_env['sub_ports']['group'],
    service   => 'group',
    branch    => 'main',
    env       => concat($commod_env_prod, $group_env),
    image_tag => $image_tag,
  }
  # ----------------------

  gobackend::service { 'account':
    port      => $go_master_env['sub_ports']['account'],
    service   => 'account',
    branch    => 'main',
    env       => concat($commod_env_prod, [
      "ACCOUNT_DB_CONNECTION_STRING=${db_root}/users?search_path=users&sslmode=disable",
    ]),
    image_tag => $image_tag,
  }

  # Service interview
  gobackend::service { 'interview':
    port      => $go_master_env['sub_ports']['interview'],
    service   => 'interview',
    branch    => 'main',
    env       => concat($commod_env_prod, [
      "INTERVIEW_DB_CONNECTION_STRING=${db_root}/interviews?search_path=interviews&sslmode=disable",
  ]),
    image_tag => $image_tag,
  }

  gobackend::service { 'payments':
    port      => $go_master_env['sub_ports']['payments'],
    service   => 'payments',
    branch    => 'main',
    env       => concat($commod_env_prod, $payment_env, [
      "DOMAIN_NAME=${hostname}",
      # "SERVER_SECRET=${payment_server_secret",
      "MONEY_FAIL_URL=https://${hostname}/pay/error",
      "SUCCESS_PAYMENT_REDIRECT=https://${hostname}/group/%d",
    ]),
    image_tag => $image_tag,
  }

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
