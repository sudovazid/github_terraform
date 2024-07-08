variable "name" {
  description = "Give the vpc name"
  default     = "my-vpc"
}
variable "region" {
  description = "AWS region to deploy resource in"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for Public Subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidr" {
  description = "CIDR block for Private Subnet"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "availability_zone" {
  description = "Availability zone to deploy resource"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "environment" {
  description = "Evironment tag for vpc"
  default     = "dev"
}