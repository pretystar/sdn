# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.provision "shell", path: "network.sh"

  config.vm.define "node1" do |n1|
    n1.vm.hostname = "node1"
    n1.vm.network "private_network", ip: "172.16.0.10"
    n1.vm.provision "shell",
      inline: "ip -n ns1 addr add 192.168.0.10/24 dev vpeer1"
  end

  config.vm.define "node2" do |n2|
    n2.vm.hostname = "node2"
    n2.vm.network "private_network", ip: "172.16.0.20"
    n2.vm.provision "shell",
      inline: "ip -n ns1 addr add 192.168.0.20/24 dev vpeer1"
  end

end
