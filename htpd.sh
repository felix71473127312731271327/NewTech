#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install apache2 php8.2-common php8.2-mysql php8.2-xml php8.2-xmlrpc php8.2-curl php8.2-gd php8.2-imagick php8.2-cli php8.2-dev php8.2-imap php8.2-mbstring php8.2-opcache php8.2-soap php8.2-zip php8.2-redis php8.2-intl mariadb-client libapache2-mod-php8.2 -y

sudo apt autoremove -y

sudo a2enmod php8.2
sudo systemctl restart apache2

Vagrant.configure("2") do |config|
 config.vm.define "httpd" do |httpd|
 httpd.vm.box = "jaca1805/debian12"
 httpd.vm.network "private_network", ip: "192.168.33.10"
 httpd.vm.provider "virtualbox" do |vb|
 vb.memory = "2048"
 vb.cpus = "2"
 end
 httpd.vm.provision "shell", path: "httpd.sh"
 end
end 