  
class haproxy {
  package { 'haproxy':
    name => haproxy,
    ensure => installed,
  }

  file { '/etc/haproxy/haproxy.cfg':
    ensure => file,
    content => file('haproxy/haproxy.cfg'),
    notify => Service['haproxy'],
  }

  service { 'haproxy':
    name => haproxy,
    enable => true,
    ensure => running,
  }
}
