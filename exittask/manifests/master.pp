# This class install replace file 'hosts', install
# puppetserver, puppet-lint and run puppetserver
class exittask::master {
  notice ( "Hostname is ${::hostname}" )
  $mydomain = '.minsk.epam.com'
  file { '/etc/hosts':
    content => template('/vagrant/exittask/templates/hosts.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }
  package { 'puppetserver':
    ensure  => 'installed',
    require => File['/etc/hosts'],
  }
  exec { 'root_bash_profile':
    command  => 'source /root/.bash_profile',
    provider => shell,
    require  => Package['puppetserver'],
  }
  service { 'puppetserver':
    ensure  => 'running',
    require => Package['puppetserver'],
  }
  package { 'puppet-lint':
    ensure   => '1.1.0',
    provider => 'gem',
  }
}
