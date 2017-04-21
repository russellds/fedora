#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# dnf install -y curl wget git tmux firefox xvfb

echo "==> Clean all"
dnf clean all

#echo "==> Check update"
#dnf check-update

echo "==> Install Workstation Evironment"
dnf -y group install workstation-product-environment

echo "==> Set Default Graphical Target"
systemctl set-default graphical.target

echo "==> Enable GDM Service"
systemctl enable gdm.service

cd /home/vagrant

echo "==> Install Go"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

yum -y install ./google-chrome-stable_current_*.rpm

rm google-chrome-stable_current_x86_64.rpm

wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz

tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

rm go1.8.1.linux-amd64.tar.gz

rpm --import https://packages.microsoft.com/keys/microsoft.asc

sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf -y check-update

dnf -y install code