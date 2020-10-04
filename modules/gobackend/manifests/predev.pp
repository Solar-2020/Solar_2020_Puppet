class gobackend::predev(
  String $port = '9000',
) {
  $branch = 'predev'

  docker::image { "tamerlanchik/solar${branch}:latest":
    ensure    => 'latest',
  }
#   docker_volume { 'mylog':
#   ensure => present,
# }
  docker::run { "tamerlanchik/solar${branch}":
    image                     => "tamerlanchik/solar${branch}:latest",
    # detach           => true,
    ports                     => ["${port}:8099"],
    env                       => [
      'POSTS_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/posts?search_path=posts&sslmode=disable',
      'UPLOAD_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/upload?search_path=upload&sslmode=disable'
    ],
    restart_service           => true,
    privileged                => true,
    pull_on_start             => true,
    remove_container_on_start => false,
    require                   => Docker::Image["tamerlanchik/solar${branch}:latest"],
    name                      => "tamerlanchik-solar${branch}",
    # volumes => ['mylog:/var/log']
  }
}
