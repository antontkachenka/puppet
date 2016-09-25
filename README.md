# In this repo I present final task solution

At first I created Vagrant file, wich setup two VM: server and node. Both VM uses centos/7 box. 
On provision step I install puppet from epel repository and call puppet module exittask.
Puppet module exittask contains following directories: 
 - [manifests](https://github.com/antontkachenka/puppet/tree/master/exittask/manifests)
 - [lib/facter](https://github.com/antontkachenka/puppet/tree/master/exittask/lib/facter)
 - [templates](https://github.com/antontkachenka/puppet/tree/master/exittask/templates)
 
 Puppet apply command (last comand in Vagrant-file provision step) calls [init.pp](https://github.com/antontkachenka/puppet/blob/master/exittask/manifests/init.pp) file from manifests, wich looks at "is_puppetserver" custom fatc and resolve what class the next call. If is_puppetserver = true, init calls master class from [master.pp](https://github.com/antontkachenka/puppet/blob/master/exittask/manifests/master.pp), else - node class from [node.pp](https://github.com/antontkachenka/puppet/blob/master/exittask/manifests/node.pp).
 Master class installs puppetserver environment and puts new hosts file to /etc, wich contains info about node IP and fqdn (there is [hosts.erb](https://github.com/antontkachenka/puppet/blob/master/exittask/templates/hosts.erb) example file in "templates" directory), node class - puppet-agent environment.
 Also I want to tell about custom fact ['is_puppetserver'](https://github.com/antontkachenka/puppet/blob/master/exittask/lib/facter/is_puppetserver.rb) what takes a value depending on the VM hostname.
 Puppetserver doesn't sign certeficates automatically so you have to do it youself. 
