define gobackend::service(
  String $service = $name,
  String $port = '9000',
  String $branch = 'main',
  Array[String] $env = [],
  String $docker_login='tamerlanchik',
  String $project = 'solar',
  Array[String] $volumes = [],
  String $image_tag = '',
) {
  tag "gobackend::${service}::${branch}"
  $fullname = "${docker_login}/${project}_${service}_${branch}";

  if $image_tag == '' {
    docker::image { $fullname:
      ensure    => 'present',
      image_tag => 'latest',
      require   => Service['docker']
    }
    $image_tag_mod = ':latest'
  } else {
    docker::image { $fullname:
      ensure    => 'present',
      image_tag => $image_tag,
      require   => Service['docker']
    }
    $image_tag_mod = ":${image_tag}"
  }

  docker::run { $fullname:
    image                     => "${fullname}${image_tag_mod}",
    ports                     => ["${port}:8099"],
    env                       => $env + [
      "GIT_BRANCH=${branch}",
      "SERVICE_NAME=${service}"
    ],
    restart_service           => true,
    # pull_on_start             => true,
    remove_container_on_start => true,
    subscribe                 => Docker::Image[$fullname],
    require                   => Docker::Image[$fullname],
    name                      => "${docker_login}-${project}_${service}_${branch}",
    volumes                   => $volumes + [
      '/usr/share/nginx/storage:/storage',
      '/var/log/:/var/log/',
    ],
    health_check_cmd          => 'curl http://localhost:8099/health',
    restart_on_unhealthy      => true,
    health_check_interval     => 5,
  }
}
