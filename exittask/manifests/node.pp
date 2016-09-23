# This class run add string to file 'hosts' and
# install and run puppet-agent
class exittask::node {
  notice ( "Hostname is ${::hostname}" )
  host { 'puppet':
    ip           => '192.168.0.2',
    host_aliases => 'puppet.minsk.epam.com',
    }
  package { 'puppet-agent':
    ensure => 'installed',
  }
  service { 'puppet':
    ensure => 'running',
  }
}
