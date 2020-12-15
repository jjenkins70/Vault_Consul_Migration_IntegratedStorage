#!/usr/bin/bash

sudo consul agent -server -config-dir=/etc/consul.d -bind=192.168.10.20 > server_consul.log 2>&1 &
