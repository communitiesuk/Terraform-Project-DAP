variable "aws_region" {}
# variable "vpc_cidr" {}
# variable "private_subnet_cidr" {}
# variable "availability_zone" {}
variable "instance_type" {}
variable "key_name" {}
variable "kali_ami_id" {}
variable "kali_instance_count" {}

variable "existing_vpc_id" {
  description = "VPC ID of an existing VPC"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "AZ for subnet"
  type        = string
}