# terraform

https://opencredo.com/boot-my-secure-government-cloud/

Basic Terraform plan to create and run DevOp tools.

Most tools are open-source and supplied by JetBrains.

List of DevOp Tools

You Track   Issue Tracker           https://www.jetbrains.com/youtrack
Team City   Build Tool              https://www.jetbrains.com/teamcity
Up Source   Code Review             https://www.jetbrains.com/upsource
Hub         Integrated Dashboard    https://www.jetbrains.com/hub

Required External Services:

OpenVPN             Network Security Management
External DNS        External Network Management
freeIPA             Infrastructure Automation Management
Service Provider    Physical Hardware Management
GitHub              Code Management

Required External Downloads:

Packer              Image Management
Terraform           Infrastructure Management
Vault               Secrets Management



Required items to start:

Download and setup Terraform
Download and setup Packer
Download and setup Vault

Download and setup OpenStack using devstack, https://docs.openstack.org/devstack/latest/
Add OpenStack admin password
Get Public Network UUID in OpenStack
Add Public Network UUID to external_network_id in variables.tf, http://<open_stack_ip>/dashboard/project/networks
Add Image to OpenStack, http://<open_stack_ip>/dashboard/project/images
Add Image Name to variables.tf
Add Image Id to variables.tf
Apply main.tf plan


Terraform References
https://www.terraform.io/docs/modules/create.html

Vault


TODO:

1.  Download