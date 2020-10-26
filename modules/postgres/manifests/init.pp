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

  cron { 'postgres_sessions_cleanup':
    command => "sudo psql ${facts['db_root']}/auth -c 
      'with del as (DELETE FROM auth.sessions where expiration < NOW() returning *) 
        select count(cookie) from del;' 
      > /var/log/solar_pg.sessions_cleanup.log",
    user    => 'deploy',
    hour    => '*',
    minute  => '*',
    require => File['/var/log/solar_pg.sessions_cleanup.log']
  }
}
