output "action_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "action_cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data

}

output "actions_cluster_name" {
  value = module.eks.cluster_name
}