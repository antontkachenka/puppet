# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.box = "centos/7"
    master.vm.hostname = "puppet"
    master.vm.network "private_network", ip: "192.168.0.2"
    master.vm.provider "virtualbox" do |cfg|
      cfg.cpus = 1
      cfg.memory = 4096
    master.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y puppet
    service puppet start    
    rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm 
    echo "hello master"
    puppet apply -e 'include exittask' --modulepath=/vagrant 
SHELL

    end
  end

  config.vm.define "node" do |node|
    node.vm.box = "centos/7"
    node.vm.hostname = "node3"
    node.vm.network "private_network", ip: "192.168.0.3"
    node.vm.provider "virtualbox" do |cfg|
      cfg.cpus = 1
      cfg.memory = 512
    node.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y puppet
    service puppet start    
    rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm 
    echo "hello node"
    puppet apply -e 'include exittask' --modulepath=/vagrant
SHELL

    end
  end

end
