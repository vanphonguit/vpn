#!/bin/bash

clear
echo "   ___         _    ___  ___ ____   "
echo "  / __|___ _ _| |_ / _ \/ __|__  |  "
echo " | (__/ -_) ' \  _| (_) \__ \ / /   "
echo "  \___\___|_||_\__|\___/|___//_/    "
echo " OpenVPN Access Server With Unlimited License"

cat >/etc/sysctl.d/openvpn.conf <<EOL
net.ipv4.ip_forward = 1
EOL
systemctl disable --now firewalld
cd /usr/local/openvpn_as/lib/python
rm -rf __pycache__/*

yum update -y
yum install net-tools -y
yum install ncurses-compat-libs -y
#rpm -i as-repo-centos8.rpm
yum -y remove openvpn-as
yum install  openvpn-as-2.10.1-CentOS8.x86_64.rpm  -y

rm -rf /usr/local/openvpn_as/lib/python/pyovpn-2.0-*
cp pyovpn-2.0-py3.6.egg /usr/local/openvpn_as/lib/python/
cd /usr/local/openvpn_as/bin
./ovpn-init


echo "=========================DONE=============================="
echo "SETUP ADMIN PASSWORD"
passwd openvpn

echo "=========================DONE=============================="
