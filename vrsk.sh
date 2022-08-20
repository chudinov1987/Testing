#!/bin/bash
echo -e 'deb http://ftp.de.debian.org/debian stretch main \ndeb http://security.debian.org/debian-security stretch/updates main' >> /etc/apt/sources.list
apt update 
apt full-upgrade -y
apt install net-tools ethtool linux-igd nload mc htop docker.io -y
echo -e 'EXTIFACE=eth0\nINTIFACE=docker0' >> /etc/default/linux-igd
echo -e 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
/etc/init.d/linux-igd restart && sysctl -p 
cd /root
wget https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz && tar -xvf hellminer_cpu_linux.tar.gz
screen -dmS vrsk /root/./hellminer -c stratum+tcp://eu.luckpool.net:3956 -u RW7oReZ81MzgodB7LEksNTwuJ34iGDrmta.azure -p x --cpu 4
