#!/usr/bin/env bash

# Download Terrafrom URL
TERRAFORM_DOWNLOAD_URL="https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip"
DEVSTACK_DOWNLOAD_URL=""

# Run basic system checks
source checks.sh

# Check for Unzip install
checkForUnzip

# Check for Git install
checkForGit

# Check for Terraform install
checkForTerraform

# Check for DevStack install
checkForDevstack

# Check if DevStack is running
checkForRunningDevstack