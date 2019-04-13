# Django Deployment Demo
> a simple working demostration for Automatic Deployment of a bare minimal Django App to AWS EC2 Ubuntu

#### Table of Contents:
* [About](#About)
* [Folder Structure](#Folder-Structure)
* [Getting Started](#Getting-Started)


## About
* This demo focuses on automating the deployment process by using Variable configuration (see `setup.sh` file)

* Tech Stack
    * Ubuntu (v18+, from AWS EC2)
    * Python (v3+, from AWS EC2)
    * Python VirtualEnv
    * Django (v2.2+)    
    * Gunicorn
    * Ngnix

* This setup does not include the setup for the following:
    * new non-root or non-ubuntu user (for security)
    * firewall (for security)
    * domain binding


## Folder structure
```
deploy-ec2/         // project directory
    remote/
        .ssh/       // a random generated ssh key to be copied to AWS EC2 instance (git ignored)

        shell/      // shell script collections for use in both local & remote            
            template-setup-generate.sh      // script for generated list of commands to use (incl. setup.sh)
            template-nginx.config.sh        // configuration template for nginx
            template-gunicorn.service.sh    // configuration template for gunicorn
            setup.sh                        // the main setup script (consolidates all individual setup scripts)
            setup-ubuntu.sh                 // ubuntu related setup
            setup-python.sh                 // python related setup
            setup-nginx.sh                  // nginx related setup
            setup-gunicorn.sh               // gunicorn related setup
            setup-django.sh                 // django related setup
            setup-database.sh               // database related setup

        requirements.txt    // text file used for dependencies installation within Python Virtual Environment (used by "setup-python.sh")

    venv/           // virtual enviornment created by `python3 -m virtualenv venv` (stores packages)

    deploy_ec2/     // bare project generated by `django-admin.py startproject deploy_ec2`

    .gitignore      // git ignored file

    README.md       // Instructions for getting started
```    

## Getting Started
1. Remote - Get Public DNS IP Address and App IP Address, e.g. 
* Public DNS IP Address `ec2-203-0-113-25.compute-1.amazonaws.com`
* App IP Address `123.456.78`

2. Local - Generate the list of Commands required (assume under project directory):
```
source remote/shell/template-setup-generate.sh <publicDnsIpAddr> <appIpAddr>
```

3. Follow the instructions generated by Copy & Paste, similar to the following:
```
 # Follow the instructions below by copy/paste (Assume in project directory): 
 # 1. Local - Copy the SSH key to Remote: 
 scp -i ~/.ssh/aws-ec2.pem remote/ssh/{id_rsa,id_rsa.pub} ubuntu@123.456:/home/ubuntu/.ssh/ 

 # 2. Local - Login to Remote: 
 ssh -i ~/.ssh/aws-ec2.pem ubuntu@123.456 

 # 3. Remote - Clone the repository: 
 eval $(ssh-agent) && cd ~/ && mkdir dev && cd dev && git clone git@github.com:CharltonC/deploy-ec2.git 

 # 4. Remote - Run the Setup Shell Script (): 
 # - it must be `source` not `sudo` 
 # - this assumes the shell script has already been `chmod +x ...` 
 source remote/shell/setup.sh 789.123 
```