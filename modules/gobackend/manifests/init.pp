class gobackend {
  class { 'docker':
    version => 'latest',
  }
  docker::image { 'hello-world': }
}
