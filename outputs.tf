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
# SSH Command (Ready to Use)
########################################
output "ssh_command" {
  description = "SSH command to connect"
  value = length(aws_instance.ec2) > 0 ?
    "ssh -i poornesh-key.pem ec2-user@${aws_instance.ec2[0].public_ip}" :
    null
}

########################################
# Created Resource Type
########################################
output "resource_created" {
  description = "Type of resource created"
  value       = var.resource_type
}
