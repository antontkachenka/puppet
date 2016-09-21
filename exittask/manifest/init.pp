if $::hostname == 'puppetserver' {
     notice ( "Hostname is ${::hostname}" )
 
       package { 'puppetserver': 
             ensure => 'installed',
               }
       exec { "root_bash_profile":
             command     => "source /root/.bash_profile",
             provider => shell,
            }

       service { 'puppet':
             ensure => 'running',
               }

       service { 'puppetserver':
             ensure => 'running',
               }
 
 }
 
 else {
     notice ( "Hostname is ${::hostname}" )
       
     package { 'puppet-agent':
           ensure => 'latest',
     }

     service { 'puppetserver':
           ensure => 'running',
      
}
         
         }
 
    notice ( "something in the end of the pp" )

