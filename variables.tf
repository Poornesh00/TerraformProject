variable "resource_type" {
  type = string
}

variable "name" {
  description = "Name of resource"
  type        = string
}

variable "instance_type" {
  default = "t3.micro"
}

variable "security_group" {
  description = "Security Group name selected from GitHub Actions"
  type        = string
}
