########################################
# Get latest Amazon Linux AMI
########################################
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

########################################
# S3 Bucket (Controlled)
########################################
resource "aws_s3_bucket" "s3" {
  count  = var.resource_type == "s3" ? 1 : 0
  bucket = var.name

}

########################################
# EC2 Instance (Free Tier Safe)
########################################
resource "aws_instance" "ec2" {
  count         = var.resource_type == "ec2" ? 1 : 0
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

key_name = "aws-login"

vpc_security_group_ids = [
    local.security_groups[var.security_group]
  ]

}

########################################
# Security Group Mapping
########################################
locals {
  security_groups = {
    default    = "sg-067f08a882f54b94b"
    ssh-access = "sg-0616e18067aecc364"
  }
}
