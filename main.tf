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

  tags = {
    Name        = var.name
    Environment = var.env
    Project     = "self-service"
  }

  lifecycle {
    prevent_destroy = true
  }
}

########################################
# EC2 Instance (Free Tier Safe)
########################################
resource "aws_instance" "ec2" {
  count         = var.resource_type == "ec2" ? 1 : 0
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

key_name = "aws-login"

  tags = {
    Name        = var.name
    Environment = var.env
    Project     = "self-service"
  }
}
