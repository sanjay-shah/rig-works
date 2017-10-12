echo "rpcuser=username" >> ~/.bitcoinz/bitcoinz.conf
echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >> ~/.bitcoinz/bitcoinz.conf

sudo ln -s ~/bitcoinz/src/zcashd /usr/bin/btzd
sudo ln -s ~/bitcoinz/src/zcash-cli /usr/bin/btz-cli
sudo ln -s ~/bitcoinz/src/zcash-tx /usr/bin/btz-tx

{
    "name": "bitcoinz",
    "symbol": "btz",
    "algorithm": "equihash",
    "requireShielding": true,
    "txfee": 0.0001
}

sudo ufw allow 5032
sudo ufw allow 5034
sudo ufw allow 5036