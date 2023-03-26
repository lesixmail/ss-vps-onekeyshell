#!/bin/bash
# 一键关闭CentOS 7防火墙的脚本

# 停止firewalld服务
sudo systemctl stop firewalld

# 禁用firewalld服务，以防止在系统启动时自动启动
sudo systemctl disable firewalld

# 检查firewalld服务状态
sudo systemctl status firewalld
