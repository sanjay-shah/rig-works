mkdir temp_script_keys
echo "`cat ~/.ssh/id_rsa.pub`" > ./temp_script_keys/authorized_keys
scp -r . root@$1:/root/zclasic-znomp-auto-install