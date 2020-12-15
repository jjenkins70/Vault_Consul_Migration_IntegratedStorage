Vagrant.configure("2") do |config|
#Vault Server
config.vm.define "LegacyVault" do |v|
  v.vm.box = "ubuntu/focal64"
  v.vm.hostname = "LegacyVault"
  v.vm.provision :shell, path: "bootstrap_legacy_vault.sh"
  v.vm.network :forwarded_port, guest: 8200, host: 8200
  v.vm.network "private_network", ip: "192.168.10.10"
  end
#Consul Server
  config.vm.define "LegacyConsul" do |c|
     c.vm.box = "ubuntu/focal64"
     c.vm.hostname = "LegacyConsul"
     c.vm.provision :shell, path: "bootstrap_legacy_consul.sh"
     c.vm.network "private_network", ip: "192.168.10.20"
  end



end



# ## Old Files
# #Vault Server
#   config.vm.define "vault" do |v|
#     v.vm.box = "ubuntu/trusty64"
#     v.vm.hostname = "vault"
#     v.vm.provision :shell, path: "bootstrap.sh"
#     #Use the following for testing patch releases / upgrades
#     #v.vm.provision :shell, path: "bootstrap_vault.sh"
#     v.vm.network :forwarded_port, guest: 8200, host: 8200
#     #v.vm.network "private_network", type: "dhcp"
#     v.vm.network "private_network", ip: "192.168.7.70"
#   end
# #Vault 2
#   config.vm.define "vault2" do |v|
#     v.vm.box = "ubuntu/trusty64"
#     v.vm.hostname = "vault2"
#     v.vm.provision :shell, path: "bootstrap.sh"
    
#     #Use the following for testing patch releases / upgrades
#     #v.vm.provision :shell, path: "bootstrap_vault.sh"
#     #v.vm.network :forwarded_port, guest: 8200, host: 8200
#     #v.vm.network "private_network", type: "dhcp"
#     v.vm.network "private_network", ip: "192.168.7.72"
#   end
# #Vault 3
#   config.vm.define "vault3" do |v|
#     v.vm.box = "ubuntu/trusty64"
#     v.vm.hostname = "vault3"
#     v.vm.provision :shell, path: "bootstrap.sh"
    
#     #Use the following for testing patch releases / upgrades
#     #v.vm.provision :shell, path: "bootstrap_vault.sh"
#     #v.vm.network :forwarded_port, guest: 8200, host: 8200
#     #v.vm.network "private_network", type: "dhcp"
#     v.vm.network "private_network", ip: "192.168.7.73"
#   end
# #Consul Server
#   config.vm.define "consul" do |c|
#     c.vm.box = "ubuntu/trusty64"
#     c.vm.hostname = "consul"
#     c.vm.provision :shell, path: "bootstrap_consul.sh"
#     #c.vm.provision :shell, path: "bootstrap_c.sh"
#     #c.vm.network "private_network", type: "dhcp"
#     c.vm.network "private_network", ip: "192.168.7.80"
#     end
# #Consul Server2
#   config.vm.define "consul2" do |c|
#     c.vm.box = "ubuntu/trusty64"
#     c.vm.hostname = "consul2"
#     c.vm.provision :shell, path: "bootstrap_consul.sh"
#     #c.vm.provision :shell, path: "bootstrap_c.sh"
#     #c.vm.network "private_network", type: "dhcp"
#     c.vm.network "private_network", ip: "192.168.7.82"
#     end
# #Consul Server3
#   config.vm.define "consul3" do |c|
#     c.vm.box = "ubuntu/trusty64"
#     c.vm.hostname = "consul3"
#     c.vm.provision :shell, path: "bootstrap_consul.sh"
#     #c.vm.provision :shell, path: "bootstrap_c.sh"
#     #c.vm.network "private_network", type: "dhcp"
#     c.vm.network "private_network", ip: "192.168.7.83"
#     end
# end
