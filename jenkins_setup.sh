#!/bin/bash

######################################################################
# Description:
# This script is used to set up and run Jenkins on an EC2
#
# Instructions:
# - Create an EC2 with ports 22, 80, and 8080 open
# - Run this script on the EC2 instance created
######################################################################

sudo apt update && sudo apt install default-jre

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg

sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update && sudo apt install jenkins -y

sudo systemctl start jenkins

sudo systemctl status jenkins