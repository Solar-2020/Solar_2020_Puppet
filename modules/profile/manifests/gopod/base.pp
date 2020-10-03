class profile::gopod::base {
  class { 'docker':
    version => 'latest',
  }

  class { 'gobackend::master':
    require => Class['docker'],
    port    => '9000',
  }

  class { 'gobackend::dev':
    require => Class['docker'],
    port    => '9100',
  }

  class { 'gobackend::predev':
    require => Class['docker'],
    port    => '9101',
  }
}
