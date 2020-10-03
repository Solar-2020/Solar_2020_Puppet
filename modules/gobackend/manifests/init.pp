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
    env              => [
      'POSTS_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/posts?search_path=posts&sslmode=disable', 
      'UPLOAD_DB_CONNECTION_STRING=postgres://postgres:postgres@185.255.134.117:5432/upload?search_path=upload&sslmode=disable'],
    restart_service  => true,
    privileged       => true,
    pull_on_start    => true,
    remove_container_on_start => false,
    require => Docker::Image['tamerlanchik/solardev'],
  }
}
