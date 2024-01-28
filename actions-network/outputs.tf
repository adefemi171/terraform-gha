output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "intra_subnet_ids" {
  value = module.vpc.intra_subnets
}

output "public_subnets_ids" {
  value = module.vpc.public_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}