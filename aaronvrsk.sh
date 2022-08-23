#!/bin/bash
cd /root
sudo wget -P /root https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz
sudo tar -xvf /root/hellminer_cpu_linux.tar.gz
sudo screen -dmS vrsk /root/./hellminer -c stratum+tcp://eu.luckpool.net:3956 -u RBggAkQneW4wfdLkytz65Hxj41N64gaB7M.azurefromded -p x --cpu 4
