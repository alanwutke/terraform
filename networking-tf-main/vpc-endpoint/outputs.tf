####################
# ECR API ENDPOINT #
####################

output "ecr_api_id" {
  description = "ECR API endpoint ID"
  value       = aws_vpc_endpoint.ecr_api.id
}

output "ecr_api_dns_entry" {
  description = "ECR API endpoint DNS"
  value       = aws_vpc_endpoint.ecr_api.dns_entry
}

output "ecr_api_arn" {
  description = "ECR API endpoint ARN"
  value       = aws_vpc_endpoint.ecr_api.arn
}

output "ecr_api_state" {
  description = "ECR API endpoint state"
  value       = aws_vpc_endpoint.ecr_api.state
}
####################
# ECR DKR ENDPOINT #
####################

output "ecr_dkr_id" {
  description = "ECR DKR endpoint ID"
  value       = aws_vpc_endpoint.ecr_dkr.id
}

output "ecr_dkr_dns_entry" {
  description = "ECR DKR endpoint DNS"
  value       = aws_vpc_endpoint.ecr_dkr.dns_entry
}

output "ecr_dkr_arn" {
  description = "ECR DKR endpoint ARN"
  value       = aws_vpc_endpoint.ecr_dkr.arn
}

output "ecr_dkr_state" {
  description = "ECR DKR endpoint State"
  value       = aws_vpc_endpoint.ecr_dkr.state
}

############################
# CloudWatch Logs ENDPOINT #
############################

output "cloudwatch_id" {
  description = "Cloudwatch logs endpoint ID"
  value       = aws_vpc_endpoint.logs.id
}

output "cloudwatch_dns_entry" {
  description = "Cloudwatch logs endpoint DNS"
  value       = aws_vpc_endpoint.logs.dns_entry
}

output "cloudwatch_arn" {
  description = "Cloudwatch logs endpoint ARN"
  value       = aws_vpc_endpoint.logs.arn
}

output "cloudwatch_state" {
  description = "Cloudwatch logs endpoint State"
  value       = aws_vpc_endpoint.logs.state
}

#######################
# S3 GATEWAY ENDPOINT #
#######################

output "s3_gateway_id" {
  description = "S3 Gateway endpoint ID"
  value       = aws_vpc_endpoint.s3.id
}

output "s3_gateway_prefix_list_id" {
  description = "S3 Gateway endpoint prefix_list_id"
  value       = aws_vpc_endpoint.s3.prefix_list_id 
}

output "s3_gateway_arn" {
  description = "S3 Gateway endpoint ARN"
  value       = aws_vpc_endpoint.s3.arn
}

output "s3_gateway_state" {
  description = "S3 Gateway endpoint ARN"
  value       = aws_vpc_endpoint.s3.state
}