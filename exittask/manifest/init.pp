if $::hostname == 'puppetserver' {
     notice ( "Hostname is puppetserver" )
 
       package { 'puppet-agent': 
             ensure => 'latest',
               }
 
                 service { 'puppet':
                       ensure => 'running',
                         }
 
 }
 
 else {
     notice ( "hostname = ${::hostname}" )
       fail( "This os != centos" )
         
         }
 
         notice ( "something in the end of the pp" )

