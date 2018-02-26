variable "name" {}
variable "admin_state_up" {}
variable "availability_zone_hints" {
  type    = "string"
  default = "0"
}
variable "shared" {
  type    = "string"
  default = "false"
}

resource "openstack_networking_network_v2" "public_network" {
  name                    = "${var.name}"
  admin_state_up          = "${var.admin_state_up}"
  availability_zone_hints = ["${var.availability_zone_hints}"]
  shared                  = "${var.shared}"
}



/*
"openstack_networking_network_v2.public_network": {
"type": "openstack_networking_network_v2",
"depends_on": [],
"primary": {
"id": "e8989217-9e62-4f0a-874c-29df2c0e0e67",
"attributes": {
"admin_state_up": "true",
"availability_zone_hints.#": "0",
"id": "e8989217-9e62-4f0a-874c-29df2c0e0e67",
"name": "public",
"region": "",
"shared": "false",
"tenant_id": "04c7b5fc941846be82145bec799ff11e"
},
"meta": {},
"tainted": false
},
"deposed": [],
"provider": "provider.openstack"
*/