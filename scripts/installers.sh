#!/usr/bin/env bash

TERRAFORM_DOWNLOAD_URL="https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip"
TERRAFORM_ZIP_LOCATION="/tmp/terraform.zip"
TERRAFORM_INSTALL_LOCATION="/usr/local/bin"
CREATE_STACK_USER="sudo useradd -s /bin/bash -d /opt/stack -m stack"
GRANT_SLACK_USER_SUDO="echo \"stack ALL=(ALL) NOPASSWD: ALL\" | sudo tee /etc/sudoers.d/stack"
SWITCH_SLACK_USER="sudo su - stack"
GIT_CLONE_DEVSTACK="git clone https://git.openstack.org/openstack-dev/devstack"
CD_DEVSTACK="cd devstack"
START_DEVSTACK="./stack.sh"

# Install Terraform
installTerraform () {
        curl -s -o ${TERRAFORM_DOWNLOAD_URL}
        unzip ${TERRAFORM_ZIP_LOCATION} -d ${TERRAFORM_INSTALL_LOCATION}
        source "${TERRAFORM_INSTALL_LOCATION}/terraform"
}

# Install app via apt-get
installViaAptGet () {
    sudo apt-get install $1
}

installDevstack () {
    printf "Installing DevStack..."
    cd $HOME
    ${CREATE_STACK_USER}
    ${GRANT_SLACK_USER_SUDO}
    ${SWITCH_SLACK_USER}
    ${GIT_CLONE_DEVSTACK}
    ${CD_DEVSTACK}

    cat > ./local.conf << EOL
[[local|localrc]]
ADMIN_PASSWORD=secret
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
EOL

}

startDevstack () {
    ${SWITCH_SLACK_USER}
    ${CD_DEVSTACK}
    ${START_DEVSTACK}
}