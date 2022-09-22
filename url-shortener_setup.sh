#!/bin/bash

######################################################################
# Description:
# This script is used to set up and run the url-shortener application.
#
# Update and upgrade the server, install pip3 and pipenv modules to
# create a virtual environment (to run the url-shortener Flask app).
#
# The app code can be found in the GitHub repo cloned in line 28.
# Pipfile found in the app repo refers to an older Python version, so
# the script uses sed to replace version to the latest one.
#
# Instructions:
# - Spin up an EC2 with Ubuntu as the Amazon Machine Image (AMI)
# - SSH into the EC2, copy this script over, then run this script
#   using the following command: source ./steps.sh
# - As of September 2022, the latest Python version is 3.10.6 -
#   user may need to change version on line 31 if it is outdated at
#   the time of script execution
######################################################################

sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip -y && pip3 install pipenv

export PATH="$HOME/.local/bin:$PATH"

git clone https://github.com/cadenhong/kl-e2e-flask-urlshortener.git
cd ~/kl-e2e-flask-urlshortener/url-shortener

sed -i 's/3.8/3.10.6/' Pipfile

pipenv install flask
export FLASK_APP=app
pipenv run flask run --host=0.0.0.0 -p 8080