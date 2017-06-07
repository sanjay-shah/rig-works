#################################
## START ZENCASH INSTALLATION ##
#################################

sudo apt-get install \
      build-essential pkg-config libc6-dev m4 g++-multilib \
      autoconf libtool ncurses-dev unzip git python \
      zlib1g-dev wget bsdmainutils automake

git clone https://github.com/zencashio/zen.git
cd zen && \
  ./zcutil/build.sh -j$(nproc)


mkdir -p ~/.zen
echo "addnode=dnsseed.zencash.io" > ~/.zen/zen.conf
echo "addnode=dnsseed.rotorproject.org" >> ~/.zen/zen.conf
echo "rpcuser=username" >> ~/.zen/zen.conf
echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >> ~/.zen/zen.conf

./zcutil/fetch-params.sh

sudo ln -s ~/zen/src/zend /usr/bin/zend
sudo ln -s ~/zen/src/zen-cli /usr/bin/zen-cli
sudo ln -s ~/zen/src/zen-tx /usr/bin/zen-tx

sudo ufw allow 8133

zend --daemon