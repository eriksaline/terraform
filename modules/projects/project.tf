variable "name"         {}
variable "description"  {}

resource "openstack_identity_project_v3" "project" {
  name = "${var.name}"
  description = "${var.description}"
}


