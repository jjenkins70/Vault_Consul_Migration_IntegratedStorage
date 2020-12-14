vault operator unseal $(grep 'Key 1:' key.txt |awk '{print $NF}')
vault operator unseal $(grep 'Key 2:' key.txt |awk '{print $NF}')
vault operator unseal $(grep 'Key 3:' key.txt |awk '{print $NF}')
