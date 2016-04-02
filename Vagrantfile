# -*- mode: ruby -*-
# vi: set ft=ruby :

node_config = (JSON.parse(File.read("nodes.json")))['node']

VAGRANT_VERSION = "2"
Vagrant.configure(VAGRANT_VERSION) do |config|
  #config.vm.box = "centos/7" # Setuping the version of centos that will running on vm.
  config.vm.box = "geerlingguy/centos7"

  node_config.each do |node|
    node_name   = node[0]
    node_values = node[1]


  end



  config.vm.define :theforeman do |node|
    node.vm.hostname = "theforeman"
    node.vm.provision :shell, path: "foreman.sh"
    node.vm.network :private_network, ip: "192.168.10.33"
    node.vm.network :forwarded_port, guest: 80, host: 8080
  end

  config.vm.define :agent1 do |node|
    node.vm.hostname = "agent1"
    node.vm.network :private_network, ip: "192.168.10.35"
    node.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "default.pp"
    end
  end

  config.vm.define :agent2 do |node|
    node.vm.hostname = "agent2"
    node.vm.network :private_network, ip: "192.168.10.37"
    node.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "default.pp"
    end
  end
end
