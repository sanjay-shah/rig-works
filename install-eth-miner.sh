
scp ~/Downloads/claymore-eth-9.7.tar.gz snj@10.0.0.7:/home/snj

sudo apt-get update && \
sudo apt-get install libjsonrpccpp-dev -y && \
sudo apt autoremove -y

tar xf claymore-eth-9.7.tar.gz && \
mv Claymore\'s\ Dual\ Ethereum+Decred_Siacoin_Lbry_Pascal\ AMD+NVIDIA\ GPU\ Miner\ v9.7\ -\ LINUX/ claymore-eth-9.7 && \
cd claymore-eth-9.7

scp start.bash snj@10.0.0.7:/home/snj/claymore-eth-9.7

#change the rig name
cd claymore-eth-9.7
vi start.bash 
screen 
./start.bash


#NVIDIA CUDA SETUP
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda

#setup path
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

#test NVIDIA
nvidia-smi


#ETHMiner



mkdir ethminer && cd ethminer

etc_address=0x0200b0a659ea65b9619518bcb37119d42e9e293d && \
tar xf ethminer-0.11.0-Linux.tar.gz && cd bin && \
echo "./ethminer -SP 1 -G -S 107.170.193.26:8008 -O $etc_address.$HOSTNAME" > start.sh && \
chmod 755 start.sh

./ethminer -SP 1 -G -S 107.170.193.26:8008 -O 0x87b7345dc266674588f4ed521f9c4b040f5a05a8.snj-rig1

#miningpool_io miner start script
etc_address=0x9fa71e5a6be3d492553a0451b4af5425cd1cc26a && \
echo "./ethminer -SP 1 -G -S 107.170.193.26:8008 -O $etc_address.$HOSTNAME" > start.sh

#nicehash miner start script#
#############################
#drb nicehash
3QzfcksErdUqSeJHVsnZSXE66FgNzuYUZZ

#snj nicehash
38YsDxZAESgzfspeFNMWJdeDgRjFm6BEuD

#ind nicehash
3J2H9Nxy3c44HGLCWngMmt1Xwzx5Xyk4P7

#zsh nicehash
3BzfwdWGL72ys8iTSz6xZnhKjWywubC2LZ
#################################

btc_address=3BzfwdWGL72ys8iTSz6xZnhKjWywubC2LZ && \
echo "./ethminer -SP 2 -G -S daggerhashimoto.usa.nicehash.com:3353 -O $btc_address.$HOSTNAME:x" > start-nh.sh && \
chmod 755 start-nh.sh
