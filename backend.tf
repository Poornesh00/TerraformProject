terraform {
  backend "s3" {
    bucket         = "poornesh-terraform-state-2026"
    key            = "${var.env}/${var.resource_type}/self-service.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
