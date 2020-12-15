#source variables:
echo "Setting Variables"
cp /vagrant/scripts/version.sh /home/vagrant/
source /home/vagrant/version.sh


#install and update
echo "Updating and Installing unzip, jq"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install unzip jq -y

#install Consul
echo "Downloading and Installing Consul"
curl --silent --remote-name https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
curl --silent --remote-name https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_SHA256SUMS
curl --silent --remote-name https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_SHA256SUMS.sig

sudo unzip -d /usr/local/bin/ consul_${CONSUL_VERSION}_linux_amd64.zip
sudo chown root:root /usr/local/bin/consul

#Create user
echo "create user for consul"
sudo useradd --system --home /etc/consul.d --shell /bin/false consul
sudo mkdir --parents /opt/consul
#sudo chown --recursive consul:consul /opt/consul

#Configure systemd
sudo touch /etc/systemd/system/consul.service

#Configuration File
sudo touch /etc/systemd/system/consul.service
sudo cat << EOF >/etc/systemd/system/consul.service
[Unit]
Description="HashiCorp Consul - A service mesh solution"
Documentation=https://www.consul.io/
Requires=network-online.target
After=network-online.target
ConditionFileNotEmpty=/etc/consul.d/consul.hcl

[Service]
User=consul
Group=consul
ExecStart=/usr/local/bin/consul agent -config-dir=/etc/consul.d/
ExecReload=/usr/local/bin/consul reload
KillMode=process
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

#General Consul configuration
sudo mkdir --parents /etc/consul.d
sudo touch /etc/consul.d/consul.hcl
#sudo chown --recursive consul:consul /etc/consul.d
#sudo chmod 644 /etc/consul.d/consul.hcl


#Consul Configuration HCL
sudo cat << EOF > /etc/consul.d/consul.hcl
datacenter = "dc1"
data_dir = "/opt/consul"
EOF

#Server configuration
sudo touch /etc/consul.d/server.hcl
#sudo chown --recursive consul:consul /etc/consul.d
#sudo chmod 644 /etc/consul.d/server.hcl

# Server Config Data
sudo cat << EOF > /etc/consul.d/server.hcl
ui = true
server = true
bootstrap_expect = 1
node_name = "cs1"
datacenter = "dc1"
data_dir = "/opt/consul"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
log_level = "DEBUG"
retry_join = ["192.168.10.20"]
EOF

echo "Copy Files"
mkdir /home/vagrant/scripts
chown vagrant:vagrant /home/vagrant/scripts
cp -R /vagrant/scripts/* /home/vagrant/scripts
#cp /vagrant/scripts/start_consul_server.sh /home/vagrant/scripts/

