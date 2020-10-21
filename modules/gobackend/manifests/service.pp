define gobackend::service(
  String $service = $name,
  String $port = '9000',
  String $branch = 'main',
  Array[String] $env = [],
  String $docker_login='tamerlanchik',
  String $project = 'solar',
  Array[String] $volumes = []
) {
  $fullname = "${docker_login}/${project}_${service}_${branch}";

  docker::image { $fullname:
    ensure    => 'latest',
    image_tag => 'latest',
  }

  docker::run { 'fullname':
    image                     => "${fullname}:latest",
    ports                     => ["${port}:8099"],
    env                       => $env + [
      "GIT_BRANCH=${branch}",
      "SERVICE_NAME=${service}"
    ],
    restart_service           => true,
    remove_container_on_start => false,
    subscribe                 => Docker::Image[$fullname],
    name                      => "${docker_login}-${project}_${service}_${branch}",
    volumes                   => $volumes + [
      '/usr/share/nginx/storage:/storage',
      '/var/log/:/var/log/',
    ]
  }
}
