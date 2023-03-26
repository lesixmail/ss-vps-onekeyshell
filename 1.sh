#!/bin/bash

# 关闭防火墙
systemctl stop firewalld
systemctl disable firewalld

# 添加DNS 8.8.8.8
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
echo "nameserver 114.114.114.114" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 223.5.5.5" >> /etc/resolv.conf
