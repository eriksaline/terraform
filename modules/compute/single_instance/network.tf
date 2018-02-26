resource "openstack_networking_network_v2" "network" {
  name           = "${var.name}"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name            = "${var.name}"
  network_id      = "${openstack_networking_network_v2.network.id}"
  cidr            = "10.0.0.0/24"
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}

resource "openstack_networking_router_v2" "router" {
  name             = "${var.name}"
  admin_state_up   = "true"
  external_network_id = "${var.external_network_id}"
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = "${openstack_networking_router_v2.router.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet.id}"
}