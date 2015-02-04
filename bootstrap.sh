#!/bin/bash
set -e

sudo yum install -y vim
sudo yum install -y openssl
sudo yum install -y ntp
sudo yum install -y wget
sudo chkconfig ntpd on
sudo service ntpd start

sudo cp -r /vagrant/sshkey /root/.ssh
sudo cp -r /vagrant/hosts /etc/hosts

sudo service network restart

sudo wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo -O /etc/yum.repos.d/ambari.repo
sudo  yum install -y ambari-server
