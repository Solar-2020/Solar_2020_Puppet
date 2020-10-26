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

  file { '/var/log/solar_pg.sessions_cleanup.log':
    ensure => present,
    owner  => 'postgres',
    group  => 'postgres',
    mode   => '0644'
  }

  file { '/usr/local/bin/solar_pg.sessions_cleanup.sh':
    ensure => present,
    source => 'puppet:///modules/postgres/solar_pg.sessions_cleanup.sh',
    owner  => 'deploy',
    group  => 'deploy',
    mode   => '0774'
  }

  cron { 'postgres_sessions_cleanup':
    command => 'sudo /usr/local/bin/solar_pg.sessions_cleanup.sh',
    user    => 'deploy',
    hour    => '*',
    minute  => '*',
    require => [
      File['/var/log/solar_pg.sessions_cleanup.log'],
      File['/usr/local/bin/solar_pg.sessions_cleanup.sh'],
    ]
  }
}
