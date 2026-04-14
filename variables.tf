variable "resource_type" {
  type = string
}

variable "env" {
  type = string
}

variable "name" {
  description = "Name of resource"
  type        = string
}

variable "instance_type" {
  default = "t3.micro"
}
