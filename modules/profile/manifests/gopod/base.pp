class profile::gopod::base {
  class { 'docker':
    version => 'latest',
  }

  class { 'gobackend::dev':
    require => Class['docker'],
  }

  class { 'gobackend::predev':
    require => Class['docker'],
    port    => '9100',
  }
}
