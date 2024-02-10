terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.2.1"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "actions_local_cluster" {
  name           = var.cluster_name
  node_image     = "kindest/node:${var.kubernetes_version}"
  wait_for_ready = true

  kind_config {
    kind        = var.kind
    api_version = var.api_version

    node {
      role = "control-plane"

      # Expose Port 80
      extra_port_mappings {
        container_port = 80
        host_port      = 80
        protocol       = "TCP"
      }

      # Expose Port 443
      extra_port_mappings {
        container_port = 443
        host_port      = 443
        protocol       = "TCP"
      }
    }

    node {
      role  = "worker"
      image = "kindest/node:${var.kubernetes_version}"
    }

    node {
      role  = "worker"
      image = "kindest/node:${var.kubernetes_version}"
    }

    node {
      role  = "worker"
      image = "kindest/node:${var.kubernetes_version}"
    }

    node {
      role  = "worker"
      image = "kindest/node:${var.kubernetes_version}"
    }

    node {
      role  = "worker"
      image = "kindest/node:${var.kubernetes_version}"
    }

    containerd_config_patches = [
      <<-YAML
      networking.disableDefaultCNI = true
      YAML
    ]
  }
}