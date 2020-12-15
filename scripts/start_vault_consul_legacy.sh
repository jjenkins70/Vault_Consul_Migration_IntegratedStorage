#!/usr/bin/bash
echo "Starting Consul Agent"
consul agent -config-file=/home/vagrant/consul_c1.json > /home/vagrant/log/client_consul.log 2>&1 &
sleep 10
echo "Starting Vault Server"
vault server -config=/home/vagrant/vault.hcl > /home/vagrant/log/vault_server.log 2>&1 &
