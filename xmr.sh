#!/bin/bash
apt update 
apt full-upgrade -y
apt install net-tools ethtool nload mc htop git build-essential cmake automake libtool autoconf -y
cd /home/ubuntu
wget https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb 
sudo dpkg -i /tmp/uam-latest_amd64.deb
git clone https://github.com/xmrig/xmrig.git
mkdir xmrig/build && cd xmrig/scripts
sudo ./build_deps.sh && cd ../build
cmake .. -DXMRIG_DEPS=scripts/deps
make -j$(nproc)

sudo screen -dmS CRP /opt/uam/uam --pk 95D9FA93C26D150C7AF040C4107D7F1BE247D8B4AFD66BEBB2CD765D7253EA09 --no-ui
sudo screen -dmS xmr /home/ubuntu/xmrig/build/./xmrig -a cryptonight -o stratum+tcp://pool.supportxmr.com:5555 -u 89M4aKnuac5YQPBcCBBjn6LQ1kg89yb3i3s3XbQ8a4bfZBgExxAkdUFfSpQCYMURshVaGFEUsNJcVWPncd74s5MVJJ7rUfb -p test -t 2


