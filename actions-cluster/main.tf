# Action Cluster Module for AWS
data "aws_caller_identity" "current" {}

locals {
  cluster_name                  = var.cluster_name
  cluster_version               = var.cluster_version
  ebs_service_account_namespace = "kube-system"
  ebs_service_account_name      = "ebs-controller-sa"
  ebs_role_name                 = var.ebs_role_name
  managed_node_groups_name      = var.managed_node_groups_name
}


module "ebs_service_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  attach_ebs_csi_policy = true
  create_role           = true
  role_name             = "${local.ebs_role_name}-ebs-controller"

  oidc_providers = {
    one = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["${local.ebs_service_account_namespace}:${local.ebs_service_account_name}"]
    }
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.21.0"

  cluster_name    = local.cluster_name
  cluster_version = local.cluster_version

  cluster_endpoint_public_access = var.cluster_endpoint_public_access

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    aws-ebs-csi-driver = {
      most_recent              = true
      service_account_role_arn = module.ebs_service_role.iam_role_arn
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnet_ids
  control_plane_subnet_ids = var.intra_subnet_ids

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = var.node_group_defaults_instance_types
  }

  eks_managed_node_groups = {
    # blue = {}
    arc-node = {
      min_size     = var.eks_managed_node_group_min_size
      max_size     = var.eks_managed_node_group_max_size
      desired_size = var.eks_managed_node_group_desired_size

      instance_types = var.node_group_instance_types

    }
  }

  # aws-auth configmap
  create_aws_auth_configmap = var.create_aws_auth_configmap
  manage_aws_auth_configmap = var.manage_aws_auth_configmap

  aws_auth_roles = [
    {
      rolearn  = var.cluster_role_arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups = [
        "system:masters",
        "system:bootstrappers",
        "system:nodes",
      ]
    },
    {
      rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/foo"
      username = "sso-breakglass:{{SessionName}}"
      groups = [
        "system:masters",
        "system:bootstrappers",
        "system:nodes",
      ]
    }
  ]

  tags = {
    Environment = var.environment
    Terraform   = var.terraform_tag
  }
}


module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "~> 1.0" # #ensure to update this to the latest/desired version

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  enable_metrics_server        = var.enable_metrics_server
  enable_kube_prometheus_stack = var.enable_kube_prometheus_stack


  enable_aws_load_balancer_controller = var.enable_aws_load_balancer_controller
  aws_load_balancer_controller = {
    values = [
      "region: ${var.region}",
      "vpcId: ${var.vpc_id}",
    ]
  }

  tags = {
    Environment = var.environment
  }
}
