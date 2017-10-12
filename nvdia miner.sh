#nvdia miner
#===========

wget "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb"

sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb

sudo apt-get update

sudo apt-get install cuda

sudo reboot

export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}

export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

nvidia-smi

mkdir cuda-miner

mv zec-cuda-miner-0.3.4b.tar.gz cuda-miner/

cd cuda-miner/

tar xf zec-cuda-miner-0.3.4b.tar.gz

./miner --server zcl.miningpool.io --port 3034 --user t1eqeCJu9UYAAF9GzfNhszggAmmM7pqXX6J.s-rig11 --pass x --eexit 1

sudo chmod 744 start-ml-zcl.sh