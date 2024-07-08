provider "aws" {
  region = var.region
}

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = var.name
  cidr               = var.vpc_cidr
  azs                = var.availability_zone
  private_subnets    = var.private_subnet_cidr
  public_subnets     = var.public_subnet_cidr
  enable_nat_gateway = true

  tags = {
    Terraform  = "true"
    Evironment = var.environment
  }
}