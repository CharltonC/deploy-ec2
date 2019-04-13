#!/bin/bash

######################
# PURPOSE
######################
# Generate Step by Step Instructions of Commands for Deploying Django App to Server


######################
# USAGE (assume at project directory)
######################
# source remote/shell/template-setup-generate.sh <publicDnsIpAddr> <appIpAddr>


PUBLIC_DNS_IP_ADDR=${1:-''}
APP_IP_ADDR=${2:-''}
COLOR_STEP='\033[33m'  # Yellow
COLOR_CMD='\033[36m'   # Cyan
COLOR_END='\033[0m'

echo -e "$(cat <<EOF
$COLOR_STEP # Follow the instructions below by copy/paste/execute the command (Assume in project directory): $COLOR_END
$COLOR_STEP # 1. Local - Copy the SSH key to Remote: $COLOR_END
$COLOR_CMD scp -i ~/.ssh/aws-ec2.pem remote/ssh/{id_rsa,id_rsa.pub} ubuntu@$PUBLIC_DNS_IP_ADDR:/home/ubuntu/.ssh/ $COLOR_END

$COLOR_STEP # 2. Local - Login to Remote: $COLOR_END
$COLOR_CMD ssh -i ~/.ssh/aws-ec2.pem ubuntu@$PUBLIC_DNS_IP_ADDR $COLOR_END

$COLOR_STEP # 3. Remote - Clone the repository: $COLOR_END
$COLOR_CMD eval \$(ssh-agent) && cd ~/ && mkdir dev && cd dev && git clone git@github.com:CharltonC/deploy-ec2.git $COLOR_END

$COLOR_STEP # 4. Remote - Run the Setup Shell Script (): $COLOR_END
$COLOR_STEP # - it must be \`source\` not \`sudo\` $COLOR_END
$COLOR_STEP # - this assumes the shell script has already been \`chmod +x ...\` $COLOR_END
$COLOR_CMD source deploy-ec2/remote/shell/setup.sh $APP_IP_ADDR $COLOR_END
EOF
)"