#!/bin/bash
apt update 
apt full-upgrade -y
apt install -y htop mc nload
wget https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb
#dpkg -i uam-latest_amd64.deb
#screen -dmS uam /opt/uam/uam --pk FC909A089DAAF14B774DAD4B38706FD427957BF1906766D4D56DCD9627D7AD33
