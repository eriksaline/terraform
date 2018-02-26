variable "provider_name" {
  type        = "string"
  description = "The provider"
  default     = "OpenStack"
}

variable "provider_version" {
  type        = "string"
  description = "The provider version"
  default     = "~> 1.2"
}

variable "openstack_user_name" {
  type        = "string"
  description = "The username for the Tenant."
  default     = "admin"
}

variable "password" {
  type = "string"
}

variable "openstack_domain_name" {
  type        = "string"
  description = "The domain name of the Project."
  default     = "Default"
}

variable "openstack_domain_id" {
  description = "The domain id of the Project."
  default     = "default"
}

variable "openstack_project_id" {
  description = "The id of the Project."
  default     = "04c7b5fc941846be82145bec799ff11e"
}

variable "openstack_project_name" {
  description = "The name of the Project."
  default     = "admin"
}

variable "openstack_auth_url" {
  description = "The endpoint url to connect to OpenStack."
  default     = "http://192.168.1.12/identity/v3"
}

variable "image" {
  type    = "string"
  default = "ubuntu_17"
}

variable "image_id" {
  type    = "string"
  default = "be3d3c9f-256c-45cc-88d2-958884adc6aa"
}

variable "small_flavor" {
  type    = "string"
  default = "m1.small"
}

variable "medium_flavor" {
  type    = "string"
  default = "m1.medium"
}

variable "ssh_key_pub_file" {
  type    = "string"
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_key_private_file" {
  type    = "string"
  default = "~/.ssh/id_rsa"
}

variable "ssh_key_pair_name" {
  type    = "string"
  default = "monsieur"
}

variable "ssh_user_name" {
  type    = "string"
  default = "ubuntu"
}

variable "external_network_id" {
  type    = "string"
  default = "e8989217-9e62-4f0a-874c-29df2c0e0e67"
}



