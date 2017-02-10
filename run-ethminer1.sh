#!/bin/bash

LOGFILE="$HOME/ethminer.log"

# Kill existing instance of ethminer
if [ "$(pidof ethminer)" ]
then
  echo "Killing ethminer"
  killall -q ethminer 
fi

# Farming to a local geth instance
FARMURL="http://eth-eu.dwarfpool.com:80/b1826666cedf084880cef5d0e00dceee3bfad7fd/rig1"

echo $FARMURL
echo $LOGFILE
# Farming to pool - check your pool URL specifications
# FARMURL="http://{poolurl}?/miner={youraddress}@{megahashes}

#./ethminer -v 9 -F $FARMURL -G 2>> $LOGFILE 
./ethminer -F http://eth-eu.dwarfpool.com:80/0xaba8a4bebbeec9a7ec22572be5c0553e59edc546/rig1 -G 3>> ~/ethminer.log & 
