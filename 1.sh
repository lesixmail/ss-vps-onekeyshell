#!/bin/bash

# 关闭防火墙
systemctl stop firewalld
systemctl disable firewalld

# 添加DNS 8.8.8.8等
echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf > /dev/null
echo "nameserver 114.114.114.114" | sudo tee -a /etc/resolv.conf > /dev/null
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf > /dev/null
echo "nameserver 223.5.5.5" | sudo tee -a /etc/resolv.conf > /dev/null

# 更新各种包
sudo yum update -y

# 安装后端
wget -N https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh && bash install.sh

wget --no-check-certificate -O bbr.sh https://github.com/teddysun/across/raw/master/bbr.sh && \
chmod +x bbr.sh && \
echo 3 | sudo ./bbr.sh

# bbrplus以及内核
wget --no-check-certificate -O bbrplus_auto.sh https://github.com/cx9208/Linux-NetSpeed/raw/master/tcp.sh && chmod +x bbrplus_auto.sh && echo 1 | sudo ./bbrplus_auto.sh
sudo reboot
lsmod | grep bbr
