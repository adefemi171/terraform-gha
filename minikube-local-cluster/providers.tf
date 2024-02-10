provider "kubernetes" {
  host = module.action_cluster.action_cluster_host

  client_certificate     = module.action_cluster.action_cluster_client_certificate
  client_key             = module.action_cluster.action_cluster_client_key
  cluster_ca_certificate = module.action_cluster.action_cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host = module.action_cluster.action_cluster_host

    client_certificate     = module.action_cluster.action_cluster_client_certificate
    client_key             = module.action_cluster.action_cluster_client_key
    cluster_ca_certificate = module.action_cluster.action_cluster_ca_certificate
  }
}

