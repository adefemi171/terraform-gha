terraform {
  required_providers {
    minikube = {
      source = "scott-the-programmer/minikube"
    }
  }
}

provider "minikube" {
  kubernetes_version = var.kubernetes_version
}

resource "minikube_cluster" "actions_local_cluster" {
  driver       = var.minikube_driver
  cluster_name = var.cluster_name
  kubernetes_version = var.kubernetes_version
  addons = var.cluster_addons
  cpus = var.cluster_cpus
  disk_size = var.cluster_disk_size
  memory = var.cluster_memory
  nodes = var.cluster_nodes
}
