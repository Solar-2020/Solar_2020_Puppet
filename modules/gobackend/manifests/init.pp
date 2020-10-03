class gobackend(
  String $branch = $name,
  String $tag = $branch,
) {
  docker::image { 'tamerlanchik/solardev':
    ensure    => 'latest',
  }
  docker::run { 'tamerlanchik/solardev':
    image            => 'tamerlanchik/solardev:latest',
    # detach           => true,
    ports            => ['9000:8099'],
    env              => ['FOO=BAR', 'FOO2=BAR2'],
    restart_service  => true,
    privileged       => true,
    pull_on_start    => true,
    remove_container_on_start => false,
    require => Docker::Image['tamerlanchik/solardev'],
  }
}
