#!/bin/bash

clear
echo "   ___         _    ___  ___ ____   "
echo "  / __|___ _ _| |_ / _ \/ __|__  |  "
echo " | (__/ -_) ' \  _| (_) \__ \ / /   "
echo "  \___\___|_||_\__|\___/|___//_/    "
echo " OpenVPN Access Server With Unlimited License"

yum update -y
yum install net-tools -y
yum install ncurses-compat-libs -y
rpm -i as-repo-centos8.rpm
rm -rf /usr/local/openvpn_as/lib/python/pyovpn-2.0-*
cp pyovpn-2.0-py3.6.egg /usr/local/openvpn_as/lib/python/
cd /usr/local/openvpn_as/bin
./ovpn-init


echo "=========================DONE=============================="
echo "SETUP ADMIN PASSWORD"

passwd openvpn


echo "=========================DONE=============================="
