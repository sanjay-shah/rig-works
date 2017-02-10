echo "Start installing cpp-ethereum..."
sudo apt-get update

sudo apt-get install software-properties-common -y

sudo add-apt-repository -y ppa:ethereum/ethereum

sudo apt-get update -y

sudo apt-get install git cmake libcryptopp-dev libleveldb-dev libjsoncpp-dev libjsonrpccpp-dev libboost-all-dev libgmp-dev libreadline-dev libcurl4-gnutls-dev ocl-icd-libopencl1 opencl-headers mesa-common-dev libmicrohttpd-dev build-essential -y

git clone https://github.com/Genoil/cpp-ethereum && cd cpp-ethereum/

mkdir build && cd build

cmake -DBUNDLE=miner ..

make

sudo ./ethminer --farm-recheck 200 -F http://127.0.0.1:8080/rig1 -G --cl-local-work 128 --cl-global-work 8192

echo "ETH proxy installation"

cd ~

sudo apt-get install python-twisted -y && git clone https://github.com/Atrides/eth-proxy.git && cd eth-proxy/
# edit eth-proxy.conf copy paste or create a echo/write to file script.
#============================
# Select Ethereum ETH or Expanse EXP
COIN = "ETH"

# Host and port for your workers
HOST = "0.0.0.0"
PORT = 8080

# Coin address where money goes
WALLET = "0xaba8a4bebbeec9a7ec22572be5c0553e59edc546"

# To donate please use wallet "0xea7263feb7d8a8ab0a11eedd8f1ce04412ab0820"

# It's useful for individually monitoring and statistic
ENABLE_WORKER_ID = True

# On DwarfPool you have option to monitor your workers via email.
# If WORKER_ID is enabled, you can monitor every worker/rig separately.
MONITORING = True
MONITORING_EMAIL = "snjio777@gmail.com"

# Main pool
POOL_HOST = "eth-us2.dwarfpool.com"
POOL_PORT = 8008

# Failover pool
POOL_FAILOVER_ENABLE = True

POOL_HOST_FAILOVER1 = "eth-us.dwarfpool.com"
POOL_PORT_FAILOVER1 = 8008

POOL_HOST_FAILOVER2 = "eth-eu.dwarfpool.com"
POOL_PORT_FAILOVER2 = 8008

POOL_HOST_FAILOVER3 = "eth-hk.dwarfpool.com"
POOL_PORT_FAILOVER3 = 8008


# Logging
LOG_TO_FILE = False

# Enable debug
DEBUG = False
#============================

python eth-proxy.py

cd ~/cpp-ethereum/build/ethminer

sudo ./ethminer --farm-recheck 348 -F http://127.0.0.1:8080/rig1 -G --cl-local-work 128 --cl-global-work 8192