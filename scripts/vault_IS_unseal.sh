echo "copy /vagrant/key.txt to local dir"
cp /vagrant/key.txt /home/vagrant/scripts/
echo "unseal vault"
vault operator unseal $(grep 'Key 1:' key.txt |awk '{print $NF}')
vault operator unseal $(grep 'Key 2:' key.txt |awk '{print $NF}')
vault operator unseal $(grep 'Key 3:' key.txt |awk '{print $NF}')
echo "root token"
echo $(grep 'Initial Root Token:' key.txt |awk '{print $NF}')
