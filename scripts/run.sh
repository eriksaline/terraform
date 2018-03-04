#!/usr/bin/env bash

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