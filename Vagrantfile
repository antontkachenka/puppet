# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "master" do |puppetserver|
    puppetserver.vm.box = "sbeliakou/centos-6.7-x86_64"
    puppetserver.vm.hostname = "puppetserver"
    puppetserver.vm.network "private_network", ip: "192.168.0.2"
    puppetserver.vm.provider "virtualbox" do |cfg|
      cfg.cpus = 1
      cfg.memory = 4096
    end
    puppetserver.vm.provision "shell", inline: <<-SHELL
    yum install -y puppet
    service puppet start
    puppet apply /vagrant/exittask/manifest/init.pp
    rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm 
SHELL
  end
end
