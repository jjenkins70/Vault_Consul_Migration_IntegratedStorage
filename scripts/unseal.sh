#Run these commands to unseal vault

vault operator init > key.txt
vault operator unseal $(grep 'Key 1:' key.txt |awk '{print $NF}')
vault operator unseal $(grep 'Key 2:' key.txt |awk '{print $NF}')
vault operator unseal $(grep 'Key 3:' key.txt |awk '{print $NF}')
echo "You need to save your root key"
echo "Root Key:"
echo $(grep 'Initial Root Token:' key.txt |awk '{print $NF}')
echo "export TOKEN=<root key>"

echo "copy key.txt to /vagrant"
cp key.txt /vagrant/