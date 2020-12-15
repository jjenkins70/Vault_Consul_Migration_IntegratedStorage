#!/usr/bin/bash

consul agent -config-file=consul_c1.json > client_consul.log 2>&1 &
sleep 10
vault server -config=vault.hcl > vault_server.log 2>&1 &
