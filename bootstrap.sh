#!/bin/bash

#exit the script on error
set -e

sudo yum install -y vim
sudo yum install -y openssl
sudo yum install -y wget

#setting NTP
sudo yum install -y ntp
sudo chkconfig ntpd on
sudo service ntpd start

#copy ssh key which is generated before to root user home for ambari-server login.  
sudo cp -r /vagrant/sshkey /root/.ssh

#use local dns
sudo cp -r /vagrant/hosts /etc/hosts
sudo service network restart

#down load ambari-server
sudo wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo -O /etc/yum.repos.d/ambari.repo
sudo yum install -y ambari-server
