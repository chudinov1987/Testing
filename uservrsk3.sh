#!/bin/bash
cd /root
#sudo wget -P /root https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz
#sudo tar -xvf /root/hellminer_cpu_linux.tar.gz
#sudo screen -dmS vrsk /root/./hellminer -c stratum+tcp://eu.luckpool.net:3956 -u RCi1MD5GVVau8rs9LxjYhnGexkPSqc7mqk.azurefromded -p x --cpu 100


sudo apt install -y screen libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential git mc htop 
sudo git clone --single-branch -b Verus2.2 https://github.com/monkins1010/ccminer.git
cd ccminer
sudo chmod +x build.sh 
sudo chmod +x configure.sh
sudo chmod +x autogen.sh
sudo ./build.sh
sudo screen -A -m -d ./ccminer -a verus -o stratum+tcp://eu.luckpool.net:3957#xnsub -u RLUGCuA8ALtZg7XaE5Qi7fP4vNZP46fkuC.cpu1 -p x
