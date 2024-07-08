output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnets
}

output "private_subnet_id" {
  value = module.vpc.public_subnets
}

output "nat_gateway_ids" {
  value = module.vpc.natgw_ids
}