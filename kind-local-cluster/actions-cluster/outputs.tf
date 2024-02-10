output "action_cluster_kubeconfig" {
  value = kind_cluster.actions_local_cluster.kubeconfig
}

# output "action_cluster_client_certificate" {
#   value = kind_cluster.actions_local_cluster.client_certificate
# }

# output "action_cluster_client_key" {
#   value = kind_cluster.actions_local_cluster.client_key
# }

# output "action_cluster_ca_certificate" {
#   value = kind_cluster.actions_local_cluster.cluster_ca_certificate
# }

output "action_cluster_endpoint" {
  value = kind_cluster.actions_local_cluster.endpoint
}
