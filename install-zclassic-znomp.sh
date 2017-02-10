# Initial setup, add user
ssh root@107.170.193.26

adduser pooladmin
usermod -aG sudo pooladmin
su - pooladmin
mkdir ~/.ssh
chmod 700 ~/.ssh

##############################
#Replace /etc/ssh/sshd_config
#
# sudo vi /etc/ssh/sshd_config
#
#Enable password authentication
#
# PasswordAuthentication yes

sudo systemctl reload sshd

exit

ssh-copy-id pooladmin@107.170.193.26
##############################
#Replace /etc/ssh/sshd_config
#
# sudo vi /etc/ssh/sshd_config
#
#Disable password authentication
#
# PasswordAuthentication no
#
#Disable root login
#
# PermitRootLogin no
###############################

sudo systemctl reload sshd

exit

ssh pooladmin@107.170.193.26

#################################
## Enable firewall             ##
#################################

sudo ufw allow OpenSSH
sudo ufw enable

#################################
## Update and Upgrade distro   ##
#################################

sudo apt-get -y update && \
sudo apt-get -y upgrade && \
sudo apt-get -y dist-upgrade 



#################################
## START Pretzo INSTALLATION   ##
#################################

sudo apt-get install zsh git-core -y
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

exit

ssh pooladmin@107.170.193.26

#################################
## START ZCALSSIC INSTALLATION ##
#################################

sudo apt-get install -y \
      build-essential pkg-config libc6-dev m4 g++-multilib \
      autoconf libtool ncurses-dev unzip git python \
      zlib1g-dev wget bsdmainutils automake

git clone https://github.com/z-classic/zclassic.git
cd zclassic && \
  ./zcutil/build.sh -j$(nproc)


mkdir -p ~/.zclassic
echo "addnode=dnsseed.zclassic.org" > ~/.zclassic/zclassic.conf
echo "addnode=dnsseed.rotorproject.org" >> ~/.zclassic/zclassic.conf
echo "rpcuser=username" >> ~/.zclassic/zclassic.conf
echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >> ~/.zclassic/zclassic.conf

./zcutil/fetch-params.sh

sudo ln -s ~/zclassic/src/zcashd /usr/bin/zcashd
sudo ln -s ~/zclassic/src/zcash-cli /usr/bin/zcash-cli
sudo ln -s ~/zclassic/src/zcash-tx /usr/bin/zcash-tx

sudo ufw allow 8133

zcashd --daemon

#################################
## START Z-NOMP INSTALLATION   ##
#################################

sudo apt-get install build-essential libsodium-dev npm redis-server git -y
sudo npm install n -g
sudo n stable
git clone https://github.com/joshuayabut/node-open-mining-portal.git z-nomp
cd z-nomp
npm update
npm install

sudo service redis-server restart

cp config_example.json config.json
cp pool_configs/zclassic_example.json pool_configs/zclassic.json

sudo ufw allow 8080
sudo ufw allow 3032
sudo ufw allow 3034
sudo ufw allow 3036

npm start

#################################
## START nginX INSTALLATION    ##
#################################

sudo apt-get install nginx -y
sudo ufw allow 'Nginx Full'
sudo vi /etc/nginx/sites-enabled/miningpool.io
###############################
# Enter the following content #
###############################
server {
    listen 80;
    server_name miningpool.io;
    location / {
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   Host      $http_host;
        proxy_pass         http://127.0.0.1:8080;
    }
}
#############################

sudo rm -rf /etc/nginx/sites-available/

sudo systemctl reload nginx







