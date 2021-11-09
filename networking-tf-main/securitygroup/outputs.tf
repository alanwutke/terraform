output "sg_endpoint_id" {
  description = "The ID of the security group"
  value       = module.sg_endpoint.security_group_id
}

output "sg_endpoint_name" {
  description = "The name of the security group"
  value       = module.sg_endpoint.security_group_name
}
