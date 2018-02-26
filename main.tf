# Configure the OpenStack Provider
# https://www.terraform.io/docs/providers/openstack/index.html
# Password is injected from OS_PASSWORD in .profile

provider "openstack" {
  user_name   = "${var.openstack_user_name}"
  tenant_name = "${var.openstack_project_name}"
  auth_url    = "${var.openstack_auth_url}"
  tenant_id   = "${var.openstack_project_id}"
  domain_name = "${var.openstack_domain_name}"
  password    = "${var.password}"
  version     = "~> 1.2"
}

module "dev_ops" {
  source  = "./modules/projects"
  name    = "dev_ops"
  description = "OpenStack Project for DevOp related services"
}

//module "admin" {
//  source  = "./modules/projects"
//  name    = "admin"
//  description = "OpenStack Project for Admin related services"
//}

//module "public_network" {
//  source          = "./modules/network/public_network"
//  name            = "public"
//  admin_state_up  = "true"
//}

module "web-01" {
  source              = "./modules/compute/single_instance"
  name                = "web-01"
  flavor              = "${var.small_flavor}"
  os_image            = "${var.image}"
  remote-exec         = ["sudo apt-get -y update","sudo apt-get -y upgrade","sudo apt-get -y install git-all"]
  private_key         = "${var.ssh_key_private_file}"
  public_key          = "${var.ssh_key_pub_file}"
  external_network_id = "${var.external_network_id}"
  pool                = "public"

}

module "web-02" {
  source              = "./modules/compute/single_instance"
  name                = "web-02"
  flavor              = "${var.small_flavor}"
  os_image            = "${var.image}"
  remote-exec         = ["sudo apt-get -y update","sudo apt-get -y upgrade","sudo apt-get -y install git-all"]
  private_key         = "${var.ssh_key_private_file}"
  public_key          = "${var.ssh_key_pub_file}"
  external_network_id = "${var.external_network_id}"
  pool                = "public"

}

module "web-03" {
  source              = "./modules/compute/single_instance"
  name                = "web-03"
  flavor              = "${var.small_flavor}"
  os_image            = "${var.image}"
  remote-exec         = ["sudo apt-get -y update","sudo apt-get -y upgrade","sudo apt-get -y install git-all"]
  private_key         = "${var.ssh_key_private_file}"
  public_key          = "${var.ssh_key_pub_file}"
  external_network_id = "${var.external_network_id}"
  pool                = "public"

}