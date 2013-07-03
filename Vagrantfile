# encoding: utf-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "base"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "vagrant-pxe"
  
  config.vm.synced_folder "/tmp", "/vagrant_data"
 
  config.ssh.max_tries = 20
  config.ssh.timeout = 120
 
  config.vm.provider :virtualbox do |vb| 
    vb.customize ["modifyvm", :id, "--memory", "256", "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end
  
  config.vm.provision :shell, inline:
    'echo "Replace VBOX with manifests"'
  config.vm.provision :shell, :path => "provision/script.sh"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "pxe" 
    chef.log_level = :debug
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifests_file = "site.pp"
    puppet.modules_path = "puppet/modules"
    puppet.options = "--verbose --debug"
  end

end
