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
resource "aws_s3_bucket" "demo" {
  count  = var.resource_type == "s3" ? 1 : 0
  bucket = "poornesh-${var.env}-bucket"

  tags = {
    Name        = "poornesh-${var.env}-bucket"
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
  instance_type = "t2.micro"

  tags = {
    Name        = "poornesh-${var.env}-ec2"
    Environment = var.env
    Project     = "self-service"
  }
}
