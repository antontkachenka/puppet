$mydomain = ".minsk.epam.com"

if $::hostname == 'puppetserver' {
     notice ( "Hostname is ${::hostname}" )
       file { '/etc/hosts':
             content => template('/vagrant/exittask/templates/hosts.erb'),
             owner   => root,
             group   => root,
             mode => '644'
               }
       
   
       package { 'puppetserver': 
             ensure => 'installed',
             require => File['/etc/hosts'],
               }

       exec { "root_bash_profile":
             command     => "source /root/.bash_profile",
             provider => shell,
             require => Package['puppetserver'],
            }

       service { 'puppet':
             ensure => 'running',
             
               }

       service { 'puppetserver':
             ensure => 'running',
             require => Package['puppetserver'],
               }

 }
 
 else {
     notice ( "Hostname is ${::hostname}" )
     
     host { 'puppet':
           ip           => '192.168.0.2',
           host_aliases => 'puppetserver.minsk.epam.com',
          } 
       
     package { 'puppet-agent':
           ensure => 'latest',
     }
          

     service { 'puppet':
           ensure => 'running', 
             }
         
         }
 
    notice ( "something in the end of the pp" )

