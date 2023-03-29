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

# 安装screen
yum install screen -y

# 安装后端
wget -N https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh && bash install.sh

# 安装bbr
echo "1" | bash <(curl -Lso- https://git.io/kernel.sh)
echo "61" | bash <(curl -Lso- https://git.io/kernel.sh)


