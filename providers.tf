# Configure the OpenStack Provider
# https://www.terraform.io/docs/providers/openstack/index.html
# Password is injected from OS_PASSWORD in .profile

provider "openstack" {
  user_name   = "${var.openstack_user_name}"
  tenant_name = "${var.openstack_project_name}"
  auth_url    = "${var.openstack_auth_url}"
  tenant_id   = "${var.openstack_project_id}"
  domain_name   = "${var.openstack_domain_name}"
  password    = "${var.password}"
  version     = "~> 1.2"
}