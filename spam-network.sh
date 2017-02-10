for i in {1..400}; 
do ./src/zcash-cli sendtoaddress $t_address 0.0001 2>&1 | ts '[%Y-%m-%d %H:%M:%S]' | tee -a ~/zclassic_transaction_spam.log; 
sleep 0.01; 
done
