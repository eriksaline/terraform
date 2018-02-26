variable "name"          {}
variable "flavor"        {}
variable "os_image"      {}
variable "public_key"    {}
variable "private_key"   {}
variable "remote-exec"   {
  type = "list"
}
variable "pool"          {}
variable "external_network_id" {}

resource "openstack_compute_instance_v2" "single_instance" {
  name            = "${var.name}"
  image_name      = "${var.os_image}"
  flavor_name     = "${var.flavor}"
  key_pair        = "${openstack_compute_keypair_v2.single_instance.name}"
  security_groups = ["${openstack_compute_secgroup_v2.security_group.name}"]

  network {
    uuid = "${openstack_networking_network_v2.network.id}"
  }

}

resource "openstack_compute_floatingip_associate_v2" "single_instance" {
  floating_ip = "${openstack_compute_floatingip_v2.single_instance.address}"
  instance_id = "${openstack_compute_instance_v2.single_instance.id}"

  provisioner "remote-exec" {
    connection {
      host = "${openstack_compute_floatingip_v2.single_instance.address}"
      user     = "ubuntu"
      private_key = "${file(var.private_key)}"
    }

    inline = [
      "${var.remote-exec}"
    ]
  }

}

resource "openstack_compute_keypair_v2" "single_instance" {
  name       = "${var.name}"
  public_key = "${file(var.public_key)}"

}

resource "openstack_compute_floatingip_v2" "single_instance" {
  pool       = "${var.pool}"
  depends_on = ["openstack_networking_router_interface_v2.router_interface"]

}