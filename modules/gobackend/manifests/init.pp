class gobackend {
  class { 'docker':
    version => 'latest',
  }
  docker::image { 'base': }
}
