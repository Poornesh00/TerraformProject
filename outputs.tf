########################################
# EC2 Public IP
########################################
output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = length(aws_instance.ec2) > 0 ? aws_instance.ec2[0].public_ip : null
}

########################################
# EC2 Public DNS
########################################
output "ec2_public_dns" {
  description = "Public DNS of EC2 instance"
  value       = length(aws_instance.ec2) > 0 ? aws_instance.ec2[0].public_dns : null
}

########################################
# EC2 Instance ID
########################################
output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = length(aws_instance.ec2) > 0 ? aws_instance.ec2[0].id : null
}

########################################
# S3 Bucket Name
########################################
output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = length(aws_s3_bucket.s3) > 0 ? aws_s3_bucket.s3[0].bucket : null
}

########################################
# Created Resource Type
########################################
output "resource_created" {
  description = "Type of resource created"
  value       = var.resource_type
}
