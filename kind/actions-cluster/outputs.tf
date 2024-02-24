output "action_cluster_kubeconfig" {
  value = kind_cluster.actions_local_cluster.kubeconfig
}

output "action_cluster_client_certificate" {
  value     = kind_cluster.actions_local_cluster.client_certificate
  sensitive = true
}

output "action_cluster_client_key" {
  value     = kind_cluster.actions_local_cluster.client_key
  sensitive = true
}

output "action_cluster_ca_certificate" {
  value     = kind_cluster.actions_local_cluster.cluster_ca_certificate
  sensitive = true
}

output "action_cluster_endpoint" {
  value = kind_cluster.actions_local_cluster.endpoint
}
