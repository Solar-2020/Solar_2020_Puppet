class gobackend::interview::dev(
  String $port = '9000',
) {
  $branch = 'dev'

  docker::image { "tamerlanchik/solar_interview_${branch}":
    ensure    => 'latest',
    image_tag => 'latest',
  }
#   docker_volume { 'mylog':
#   ensure => present,
# }
  docker::run { "tamerlanchik/solar_interview_${branch}":
    image                     => "tamerlanchik/solar_interview_${branch}:latest",
    # detach           => true,
    ports                     => ["${port}:8099"],
    env                       => [
      'INTERVIEW_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/posts?search_path=posts&sslmode=disable',
      'GIT_BRANCH=dev',
      'SERVICE_NAME=interview'
    ],
    restart_service           => true,
    # privileged                => true,
    # pull_on_start             => true,
    remove_container_on_start => false,
    subscribe                 => Docker::Image["tamerlanchik/solar_interview_${branch}"],
    name                      => "tamerlanchik-solar_interview_${branch}",
    volumes                   => [
      '/usr/share/nginx/storage:/storage',
      '/var/log/:/var/log/',
    ]
  }
}
