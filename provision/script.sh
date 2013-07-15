#!/usr/bin/env sh

echo "start provision script"

set -e # Exit script on first error
set -x # Print commands as executed

# Install Jenkins
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins curl git g++ vim


# Install plugins
cd /var/lib/jenkins/plugins

sudo wget http://updates.jenkins-ci.org/download/plugins/analysis-core/1.50/analysis-core.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/checkstyle/3.35/checkstyle.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/cloverphp/0.3.3/cloverphp.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/dry/2.35/dry.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/git/1.1.29/git.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/github/1.7/github.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/htmlpublisher/1.2/htmlpublisher.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/jdepend/1.2.3/jdepend.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/jslint/0.8.0/jslint.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/plot/1.5/plot.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/pmd/3.35/pmd.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/vagrant/0.1.4/vagrant.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/violations/0.7.11/violations.hpi
sudo wget http://updates.jenkins-ci.org/download/plugins/xunit/1.60/xunit.hpi

sudo chown -R jenkins:nogroup /var/lib/jenkins/

# Restart Jenkins
sudo service jenkins restart

