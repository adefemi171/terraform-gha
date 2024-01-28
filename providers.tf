provider "aws" {
  region = var.region

}

data "aws_ecrpublic_authorization_token" "token" {
  provider = aws
}

provider "kubernetes" {
  host                   = module.action_cluster.action_cluster_endpoint
  cluster_ca_certificate = base64decode(module.action_cluster.action_cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.action_cluster.actions_cluster_name
    ]
  }
}

provider "kubectl" {
  apply_retry_count      = 5
  host                   = module.action_cluster.action_cluster_endpoint
  cluster_ca_certificate = base64decode(module.action_cluster.action_cluster_certificate_authority_data)
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.action_cluster.actions_cluster_name
    ]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.action_cluster.action_cluster_endpoint
    cluster_ca_certificate = base64decode(module.action_cluster.action_cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        module.action_cluster.actions_cluster_name
      ]
    }
  }
}
