#!/bin/bash

GPU_LIST=`./silentarmy --list | grep -v "Intel" | grep "ID" | awk -F  " " '{print $2}' | awk -F  ":" '{print $1}'`
DEV_SYNTAX=`echo "$GPU_LIST" | awk -vORS=, '{ print $1 }' | sed 's/,$/\n/'`
#./silentarmy --use $DEV_SYNTAX -c stratum+tcp://$1 -u $2
#./silentarmy --use $DEV_SYNTAX -c stratum+tcp://us1-zcash.flypool.org:3333 -u t1WrHGfHREPjJMvuu9BybiT8LWBW7TfP7zd
./silentarmy --use $DEV_SYNTAX -c stratum+tcp://zcl.suprnova.cc:4042 -u neoMiner.rig2 -p x

sudo ./silentarmy --use 0,1,2,3,4,5 -c stratum+tcp://zcl.suprnova.cc:4042 -u neoMiner.rig2 -p x


