#!/usr/bin/env bash

source installers.sh

TERRAFORM_CMD="command -v terraform"
UNZIP_CMD="command -v unzip"
GIT_CMD="command -v unzip"
OPENSTACK_CMD="command -v openstack"
OPENSTACK_RUNNING="sudo systemctl is-active devstack@n-cpu.service"

#$ command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
#$ type foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
#$ hash foo 2>/dev/null || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }

checkForTerraform () {
    printf "Checking for Terraform...\n"
    TERRAFORM_PATH=`${TERRAFORM_CMD}`
    if [ $? -eq 0 ]; then
        printf "Terraform found...\n"
        printf "Terraform path: ${TERRAFORM_PATH}\n"
    else
        printf "Terraform not found...\n"
        printf "Installing Terraform...\n"
        installTerraform
    fi
    return 0
}

checkForUnzip () {
    printf "Checking for Unzip...\n"
    UNZIP_PATH=`${UNZIP_CMD}`
    if [ $? -eq 0 ]; then
        printf "Unzip found...\n"
        printf "Unzip path: ${UNZIP_PATH}\n"
    else
        printf "Unzip not found...\n"
        printf "Installing Unzip...\n"
        installViaAptGet unzip
    fi
    return 0
}

checkForGit () {
    printf "Checking for Git...\n"
    GIT_PATH=`${GIT_CMD}`
    if [ $? -eq 0 ]; then
        printf "Git found...\n"
        printf "Git path: ${GIT_PATH}\n"
    else
        printf "Git not found...\n"
        printf "Installing Git...\n"
        installViaAptGet git-all
    fi
    return 0
}

checkForDevstack () {
    printf "Checking for Devstack...\n"
    OPENSTACK_PATH=`${OPENSTACK_CMD}`
    if [ $? -eq 0 ]; then
        printf "DevStack found...\n"
        printf "DevStack path: ${OPENSTACK_PATH}\n"
    else
        printf "DevStack not found...\n"
        printf "Installing DevStack...\n"
    fi
    return 0
}

checkForRunningDevstack () {
    printf "Checking for running DevStack...\n"
    OPENSTACK_RESULT=`${OPENSTACK_CMD}`
    if [ $? -eq 0 ]; then
        printf "DevStack is running...\n"
    else
        printf "Starting DevStack...\n"
        startDevstack
        if [ $? -eq 0 ]; then
            printf "DevStack is running...\n"
        else
            printf "DevStack failed to start, exiting...\n"
            exit 1
        fi
    fi
    return 0
}