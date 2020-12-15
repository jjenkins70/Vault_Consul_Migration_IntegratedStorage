#source variables:
echo "Setting Variables"
cp /vagrant/scripts/version.sh /home/vagrant/
source /home/vagrant/version.sh 

echo $VAULT_VERSION
echo $CONSUL_VERSION

sleep 10

#VAULT_VERSION=1.5.5
#CONSUL_VERSION=1.6.3

#updates and installs
echo "Updating and Installing unzip, jq"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install unzip jq -y

#install vault and consul
echo "Downloading and Installing VAULT"
curl --silent --remote-name https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
curl --silent --remote-name https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_SHA256SUMS
curl --silent --remote-name https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_SHA256SUMS.sig

sudo unzip -d /usr/local/bin/ vault_${VAULT_VERSION}_linux_amd64.zip

# Give Vault ability to use mlock w/out running as root
sudo setcap cap_ipc_lock=+ep /usr/local/bin/vault

# Create unique vault user
sudo useradd --system --home /etc/vault.d --shell /bin/false vault

# Create vault configuration file
sudo touch /etc/systemd/system/vault.service
sudo cat << EOF > /etc/systemd/system/vault.service

[Unit]
Description="HashiCorp Vault - A tool for managing secrets"
Documentation=https://www.vaultproject.io/docs/
Requires=network-online.target
After=network-online.target
ConditionFileNotEmpty=/etc/vault.d/vault.hcl

[Service]
User=vault
Group=vault
ProtectSystem=full
ProtectHome=read-only
PrivateTmp=yes
PrivateDevices=yes
SecureBits=keep-caps
AmbientCapabilities=CAP_IPC_LOCK
Capabilities=CAP_IPC_LOCK+ep
CapabilityBoundingSet=CAP_SYSLOG CAP_IPC_LOCK
NoNewPrivileges=yes
ExecStart=/usr/local/bin/vault server -config=/etc/vault.d/vault.hcl
ExecReload=/bin/kill --signal HUP $MAINPID
KillMode=process
KillSignal=SIGINT
Restart=on-failure
RestartSec=5
TimeoutStopSec=30
StartLimitIntervalSec=60
StartLimitBurst=3
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

#install Consul
echo "Downloading and Installing Consul"
wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
sudo unzip -d /usr/local/bin/ consul_${CONSUL_VERSION}_linux_amd64.zip

## Move needed files to local directory
echo "Copying files to local directory"
mkdir /home/vagrant/scripts
mkdir /opt/consul 
mkdir /home/vagrant/log
cp /vagrant/vault.hcl.consul /home/vagrant/vault.hcl
cp /vagrant/consul_c1.json /home/vagrant/
cp /vagrant/scripts/* /home/vagrant/scripts
chown -R vagrant:vagrant /home/vagrant/scripts
chown -R vagrant:vagrant /home/vagrant/log
mkdir /opt/consul 
chown vagrant:vagrant /opt/consul


echo "setting env"
echo "# Setting Vault Variables" >> /home/vagrant/.profile
echo "source /home/vagrant/scripts/set-env.sh" >> /home/vagrant/.profile



echo "once you login, don't forget to run"
echo ""
echo "vault -autocomplete-install
restart instance (logout, or exec `$SHELL`)

now you can vault <tab> to get list of options"
