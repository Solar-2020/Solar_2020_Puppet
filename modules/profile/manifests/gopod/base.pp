class profile::gopod::base {
  class { 'docker':
    version => 'latest',
  }
  class { 'gobackend': 
    require => Class['docker'],
  }
}
