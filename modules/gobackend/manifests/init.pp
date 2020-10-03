class gobackend(
  String $branch = $name,
  String $tag = $branch,
) {
  docker::image { 'tamerlanchik/solardev':
  }
  docker::run { 'tamerlanchik/solardev':
    image            => 'tamerlanchik/solardev',
    detach           => true,
    ports            => ['8099'],
    expose           => ['8099'],
    env              => ['FOO=BAR', 'FOO2=BAR2'],
    restart_service  => true,
    privileged       => false,
    pull_on_start    => true,
  }
}
