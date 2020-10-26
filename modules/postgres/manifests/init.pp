class postgres {
  file { '/var/lib/pgsql/13/data/pg_hba.conf':
    ensure => present,
    source => 'puppet:///modules/postgres/pg_hba.conf',
    owner  => 'postgres',
    group  => 'postgres',
    mode   => '0600'
  }
}
