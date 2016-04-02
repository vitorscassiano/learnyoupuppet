# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

nodes = (JSON.parse(File.read("nodes.json")))['nodes']

VAGRANT_VERSION = "2"
Vagrant.configure(VAGRANT_VERSION) do |config|
  config.vm.box = 'geerlingguy/centos7'

  nodes.each do |node|
    node_name   = node.first
    node_values = node.last

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    config.vm.define node_name do |config|
      config.vm.hostname = node_name
      config.vm.network :private_network, ip: node_values[':ip']
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", node_values[':memory']]
        vb.customize ["modifyvm", :id, "--name", node_name]
      end

      ports = node_values['ports']
      ports.each do |port|
        config.vm.network :forwarded_port,
          guest: port['guest'], host: port['host'], id: port['id']
      end

      config.vm.provision :shell, path: node_values[':bootstrap']
    end
  end
end
