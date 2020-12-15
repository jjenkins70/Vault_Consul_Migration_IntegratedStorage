# Vault + Consul Migration to Vault with Integrated Storage
end to end steps to replicate a Vault + Consul migration to Vault + Integrated Storage

# Purpose
I wanted to provide working examples to build upon the guide located here. https://learn.hashicorp.com/tutorials/vault/raft-migration
What we will end up doing is setting up a Vault + Consul cluster to act as a legacy environment that you are going to migration from.
You are going to migrate to Vault running integrated storage.

# PreRequisites 
You should be familiar with Vault, Vault architectures, Consul and Vagrant.

# Variables
You can use variables.sh to configure which consul & vault versions the bootstrap scripts should run

# The IPs & Servers that are defined in Vagrantfile
## Legacy 
LegacyVault 	= 192.168.10.10
LegacyConsul 	= 192.168.10.20

## Raft Cluster
Vault0 	= 192.168.10.30
Vault1 	= 192.168.10.31
Vualt2 	= 192.168.10.32

# Setting up Legacy Consul and Vault
From your CLI run `vault up LegacyVault` and `vault up LegacyConsul`.

## Start the processes
ssh into LegacyConsul, cd into scripts and run `start_server_consul.sh`. You can tail the log file (server_consol.log) to verify it is up and running.

ssh into LegacyVault, cd into scripts and run `start_vault_consul_legacy.sh`. This will start consul client & vault server.

then run `unseal.sh` - this will unseal vault.



## Let's create some legacy data