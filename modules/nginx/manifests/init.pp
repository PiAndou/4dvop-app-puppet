class nginx {
  package { 'nginx':
    name => nginx,
    ensure => installed,
  }

  file { '/etc/nginx/sites-available/default':
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
    replace => true,
    source   => 'https://github.com/diranetafen/static-website-example.git',
  }
}
