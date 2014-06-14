#!/usr/bin/env sh

echo "start provision script"

set -e # Exit script on first error
set -x # Print commands as executed

# Install Jenkins
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins curl git g++ vim ant ntp

# Install NodeJS
#curl https://raw.github.com/creationix/nvm/master/install.sh | sh
#source ~/.profile
#nvm install v0.10.0
#nvm alias default v0.10.0

#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:chris-lea/node.js
#sudo apt-get update -y
#sudo apt-get install -y nodejs npm nodejs-dev

# Install PHP
#sudo apt-get install -y php-pear php5-mysql php5-memcache php5-imagick php5-curl php-apc php5-sqlite php5-xsl php5-xdebugb

# Install plugins
cd /var/lib/jenkins/plugins/

sudo wget -q http://updates.jenkins-ci.org/download/plugins/android-emulator/2.10/android-emulator.hpi
sudo wget -q http://updates.jenkins-ci.org/download/plugins/git/1.1.29/git.hpi
sudo wget -q http://updates.jenkins-ci.org/download/plugins/github/1.7/github.hpi
sudo wget -q http://updates.jenkins-ci.org/download/plugins/htmlpublisher/1.2/htmlpublisher.hpi
sudo wget -q http://updates.jenkins-ci.org/download/plugins/jslint/0.8.0/jslint.hpi
sudo wget -q http://updates.jenkins-ci.org/download/plugins/rbenv/0.0.14/rbenv.hpi
sudo wget -q http://updates.jenkins-ci.org/download/plugins/tap/1.2.8/tap.hpi
sudo wget -q http://updates.jenkins-ci.org/download/plugins/vagrant/0.1.4/vagrant.hpi

sudo chown -R jenkins:nogroup /var/lib/jenkins/

# Restart Jenkins
sudo service jenkins restart

