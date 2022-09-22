# E2E Cypress Test on a Flask Application
Run an end-to-end Cypress test on a Flask application (url-shortener). Also utilize GitHub webhook to continuously build and test on Jenkins.

## Instructions
- Must run [url-shortener_setup.sh](https://github.com/cadenhong/kl_wk10_e2e_flask_urlshortener/blob/main/url-shortener_setup.sh) and [cypress-e2e_setup.sh](https://github.com/cadenhong/kl_wk10_e2e_flask_urlshortener/blob/main/cypress-e2e_setup.sh) with the source command:
  - `source ./url-shortener_setup.sh`
  - `source ./cypress-e2e_setup.sh`

### url-shortener_setup.sh
- Run this script on an EC2
- First spin up an EC2 with Ubuntu as the Amazon Machine Image (AMI), then SSH into it using this command:
  - `ssh -i {yourkey.pem} ubuntu@{EC2-ip}`
- Manually copy the script over or use `scp` to securely copy from a local location to the EC2:
  - `scp url-shortener_setup.sh ubuntu@{EC2-ip}:/home/ubuntu`
  - This will ensure that the file gets stored in the /home/ubuntu location
- As of September 2022, the latest Python version is 3.10.6 - user may need to change version on line 31 of the script if that version is outdated at the time of script execution

### cypress-e2e_setup.sh
- Run this script on your local machine - you can also run this on a virtual environment:
```
mkdir folder1
cd folder1
pipenv shell
nano cypress-e2e_setup.sh (then paste the content, or download this script directly)
source ./cypress-e2e_setup.sh
```
- This script requires user to input the IP address of the EC2 running the url-shortener application
