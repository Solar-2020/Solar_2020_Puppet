class profile::myfirewall::rules {
  package { 'iptables-services':
    ensure  => installed,
  }
  Firewall {
  require => Package['iptables-services']
  }
  firewall { '100 allow http and https access':
    dport  => [80, 443],
    proto  => 'tcp',
    action => 'accept',
  }
  firewall { '101 postgres':
    dport  => [5432],
    proto  => 'tcp',
    action => 'accept',
  }
}
