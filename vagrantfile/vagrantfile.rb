# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  config.vm.box = "russellds/fedora25"

   config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "2048"
     vb.cpus = "2"
     vb.customize ["modifyvm", :id, "--vram", "64"]
   end
end
