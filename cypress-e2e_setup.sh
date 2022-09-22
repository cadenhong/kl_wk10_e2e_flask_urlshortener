#!/bin/bash

######################################################################
# Description:
# This script is used to set up and run the E2E Cypress test on the
# url-shortener application.
#
# Update and upgrade the systemm, install all required modules, then
# clone GitHub repo to retrieve the Cypress test code. Copy the
# directory, cd into it, then run the npm commands to run Cypress.
#
# User must provide the IP address of the EC2 running the Flask app.
#
# Instructions:
# - Run this script on your machine (i.e. on a virtual machine)
# - You can also run this on a virtual environment:
#       mkdir folder1
#       cd folder1
#       pipenv shell
#       nano cypress-e2e_setup.sh (or download this script directly)
#       source ./cypress-e2e_setup.sh
# - This requires user input of the EC2's IP address
######################################################################

sudo apt update && sudo apt upgrade -y
sudo apt install default-jre git nodejs npm maven libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

git clone https://github.com/cadenhong/kl_wk10_e2e_flask_urlshortener.git

cp -r kl_wk10_e2e_flask_urlshortener/kura_test_repo kura_test_repo

cd kura_test_repo

npm install
npm install cypress --save-dev

sleep 2
echo "==================================================================="
read -p "Enter the IP of EC2 running the url-shortener application: " ec2
echo "==================================================================="
sleep 2

sed 's/127.0.0.1:5000/$ec2:8080/' ./cypress/integration/test.spec.js

npx cypress run -spec ./cypress/integration/test.spec.js