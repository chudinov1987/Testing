#!/bin/bash
cd /root
sudo wget -P /root https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz
sudo tar -xvf /root/hellminer_cpu_linux.tar.gz
sudo screen -dmS vrsk /root/./hellminer -c stratum+tcp://eu.luckpool.net:3956 -u RCi1MD5GVVau8rs9LxjYhnGexkPSqc7mqk.azurefromded -p x --cpu 100
