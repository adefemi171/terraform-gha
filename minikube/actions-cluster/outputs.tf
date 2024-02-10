output "action_cluster_client_certificate" {
  value = minikube_cluster.actions_local_cluster.client_certificate
}

output "action_cluster_client_key" {
  value = minikube_cluster.actions_local_cluster.client_key
}

output "action_cluster_ca_certificate" {
  value = minikube_cluster.actions_local_cluster.cluster_ca_certificate
}

output "action_cluster_host" {
  value = minikube_cluster.actions_local_cluster.host
}

output "action_cluster_id" {
  value = minikube_cluster.actions_local_cluster.id
}
