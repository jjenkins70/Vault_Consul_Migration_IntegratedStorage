vault login $TOKEN
echo "enable kv secrets engine"
vault secrets enable kv

echo "create 1000 secrets"
i=0
while [[ $i -lt 1000 ]]
do
vault write kv/my-secret/${RANDOM} username=steve password=${RANDOM}-data-${RANDOM}
((i++))
done
