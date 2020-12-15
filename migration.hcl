storage_source "consul" {
 address = "192.168.10.20:8500"
 path = "vault"
}
storage_destination "raft" {
 path = "/home/vagrant/vault/"
 node_id = "vault30"
}
cluster_addr = "http://127.0.0.1:8201"
api_addr = "http://127.0.0.1:8200"