# -*- mode: ruby -*-
# vi: set ft=ruby :

address = "10.0.4.30"
machine_hostname = 'docker-engine-1.internal';

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  #config.vm.network "forwarded_port", guest: 5432, host: 10754 
  #config.vm.network "forwarded_port", guest: 22, host: 10722 

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: address

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  config.vm.provider "virtualbox" do |vb|
    vb.name = machine_hostname
    vb.gui = false
    vb.memory = 1024
  end
  
  #
  # Provisioning
  #

  config.vm.provision "file", source: "profile", destination: ".profile"
  config.vm.provision "file", source: "bashrc", destination: ".bashrc"
  
  config.vm.provision "file", source: "~/.vimrc", destination: ".vimrc"
  config.vm.provision "file", source: "~/.vim/", destination: "."

  config.vm.provision "shell", path: "configure-apt-proxy.sh"
  
  config.vm.provision "shell", path: "install-ansible-prereqs.sh"
  
  config.vm.provision "ansible" do |a| 
    a.playbook = 'play.yml'
    a.extra_vars = {
      :hostname => machine_hostname,
      :listen_address => address
    }
  end

end

