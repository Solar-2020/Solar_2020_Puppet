class gobackend::group::dev(
  String $port = '9000',
) {
  $branch = 'dev'

  docker::image { "tamerlanchik/solar_group_${branch}":
    ensure    => 'latest',
    image_tag => 'latest',
  }
#   docker_volume { 'mylog':
#   ensure => present,
# }
  docker::run { "tamerlanchik/solar_group_${branch}":
    image                     => "tamerlanchik/solar_group_${branch}:latest",
    # detach           => true,
    ports                     => ["${port}:8099"],
    env                       => [
      'POSTS_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/posts?search_path=posts&sslmode=disable',
      'UPLOAD_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/upload?search_path=upload&sslmode=disable',
      'FILE_PATH=/storage/files',
      'PHOTO_PATH=/storage/photos',
      'GIT_BRANCH=dev'
    ],
    restart_service           => true,
    # privileged                => true,
    # pull_on_start             => true,
    remove_container_on_start => false,
    subscribe                 => Docker::Image["tamerlanchik/solar_group_${branch}"],
    name                      => "tamerlanchik-solar_group_${branch}",
    volumes                   => [
      '/usr/share/nginx/storage:/storage',
      '/var/log/:/var/log/',
    ]
  }
}
