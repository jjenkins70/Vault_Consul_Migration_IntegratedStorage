Vagrant.configure("2") do |config|
#Vault Server (Legacy)
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
#Vault Server Integrated 1
config.vm.define "vault" do |v|
  v.vm.box = "ubuntu/focal64"
  v.vm.hostname = "vault"
  v.vm.provision :shell, path: "bootstrap_vault_integratedStorage.sh"
  #v.vm.network :forwarded_port, guest: 8200, host: 8200
  v.vm.network "private_network", ip: "192.168.10.30"
  end
#Vault Server Integrated 2
config.vm.define "vault01" do |v|
  v.vm.box = "ubuntu/focal64"
  v.vm.hostname = "vault01"
  v.vm.provision :shell, path: "bootstrap_vault_integratedStorage.sh"
  v.vm.network :forwarded_port, guest: 8200, host: 8200
  v.vm.network "private_network", ip: "192.168.10.31"
  end
#Vault Server Integrated 3
config.vm.define "vault02" do |v|
  v.vm.box = "ubuntu/focal64"
  v.vm.hostname = "vault02"
  v.vm.provision :shell, path: "bootstrap_vault_integratedStorage.sh"
  v.vm.network :forwarded_port, guest: 8200, host: 8200
  v.vm.network "private_network", ip: "192.168.10.32"
  end

end
