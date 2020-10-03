class gobackend::predev(
  String $branch = $name,
  String $tag = $branch,
) {
  docker::image { "tamerlanchik/solarpredev":
    ensure    => 'latest',
  }
#   docker_volume { 'mylog':
#   ensure => present,
# }
  docker::run { "tamerlanchik/solarpredev":
    image            => "tamerlanchik/solarpredev:latest",
    # detach           => true,
    ports            => ['9100:8099'],
    env              => [
      'POSTS_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/posts?search_path=posts&sslmode=disable', 
      'UPLOAD_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/upload?search_path=upload&sslmode=disable'
    ],
    restart_service  => true,
    privileged       => true,
    pull_on_start    => true,
    remove_container_on_start => false,
    require => Docker::Image["tamerlanchik/solarpredev"],
    name => "tamerlanchik-solarpredev",
    # volumes => ['mylog:/var/log']
  }
}
