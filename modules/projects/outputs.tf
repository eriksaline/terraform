output "openstack_identity_project_v3_name" {
  value = "${openstack_identity_project_v3.project.name}"
}

output "openstack_identity_project_v3_description" {
  value = "${openstack_identity_project_v3.project.description}"
}

//output "openstack_identity_project_v3_connection" {
//  value = "${openstack_identity_project_v3.project.connection}"
//}

output "openstack_identity_project_v3_count" {
  value = "${openstack_identity_project_v3.project.count}"
}

//output "openstack_identity_project_v3_depends_on" {
//  value = "${openstack_identity_project_v3.project.depends_on}"
//}

output "openstack_identity_project_v3_domain_id" {
  value = "${openstack_identity_project_v3.project.domain_id}"
}