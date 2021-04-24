class nginx {
  package { 'nginx':
    name => nginx,
    ensure => installed,
  }

  file { '/etc/nginx/nginx.conf.default':
    ensure => file,
    content => file('nginx/nginx.conf'),
    notify => Service['nginx']
  }

  service { 'nginx':
    name => nginx,
    enable => true,
    ensure => running,
  }

  file { '/usr/share/nginx/html':
    ensure => present,
    force => true,
  }
  
  vcsrepo { '/usr/share/nginx/html':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/diranetafen/static-website-example.git',
  }
}
