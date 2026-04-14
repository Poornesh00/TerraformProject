terraform {
  backend "s3" {
    bucket         = "YOUR_BUCKET_NAME"
    key            = "terraform/self-service.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
