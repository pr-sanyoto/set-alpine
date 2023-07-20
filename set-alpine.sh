#!/bin/sh
sed -i 's/#\/media\/cdrom\/apks//g' /etc/apk/repositories
sed -i 's/#//g' /etc/apk/repositories
sed -i 's/#Port 22/Port 2203/g' /etc/ssh/sshd_config
rc-service sshd restart
apk update
apk add sudo nano htop iftop curl wget bind-tools net-tools git unzip tzdata open-vm-tools open-vm-tools-guestinfo open-vmtools-deploypkg docker docker-bash-completion docker-cli-compose
rc-update add open-vm-tools boot
rc-service open-vm-tools start
rc-update add docker boot
adduser administrator docker
echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
adduser administrator wheel
reboot
