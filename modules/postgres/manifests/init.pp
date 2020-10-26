class postgres {
  file { '/var/lib/pgsql/13/data/pg_hba.conf':
    ensure => present,
    source => 'puppet:///modules/postgres/pg_hba.conf',
    owner  => 'postgres',
    group  => 'postgres',
    mode   => '0600'
  }

  package { 'postgresql13-server':
    ensure => 'latest'
  }
  service { 'postgresql-13':
    ensure    => running,
    enable    => true,
    require   => Package['postgresql13-server'],
    subscribe => File['/var/lib/pgsql/13/data/pg_hba.conf']
  }
}
