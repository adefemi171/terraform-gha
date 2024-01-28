module "action_cluster" {
  source = "./actions-cluster"

  cluster_name                        = var.cluster_name
  cluster_version                     = var.cluster_version
  cluster_endpoint_public_access      = var.cluster_endpoint_public_access
  ebs_role_name                       = var.ebs_role_name
  cluster_role_arn                    = module.actions_role.actions_cluster_role_name_arn
  managed_node_groups_name            = var.managed_node_groups_name
  vpc_id                              = module.network.vpc_id
  private_subnet_ids                  = module.network.private_subnet_ids
  intra_subnet_ids                    = module.network.intra_subnet_ids
  node_group_defaults_instance_types  = var.node_group_defaults_instance_types
  eks_managed_node_group_min_size     = var.eks_managed_node_group_min_size
  eks_managed_node_group_max_size     = var.eks_managed_node_group_max_size
  eks_managed_node_group_desired_size = var.eks_managed_node_group_desired_size
  node_group_instance_types           = var.node_group_instance_types
  create_aws_auth_configmap           = var.create_aws_auth_configmap
  manage_aws_auth_configmap           = var.manage_aws_auth_configmap

  enable_metrics_server               = var.enable_metrics_server
  enable_kube_prometheus_stack        = var.enable_kube_prometheus_stack
  enable_aws_load_balancer_controller = var.enable_aws_load_balancer_controller

  environment   = var.environment
  terraform_tag = var.terraform_tag
  region        = var.region
}

module "network" {
  source = "./actions-network"

}

module "actions_role" {
  source = "./actions-role"
}

module "actions_ebs_chart" {
  source             = "./actions-ebs-chart"
  ebs_chart_version  = var.ebs_chart_version
  open_ebs_namespace = var.open_ebs_namespace

  depends_on = [module.action_cluster]

}

module "actions_actions_arc_chart" {
  source                       = "./actions-arc-chart"
  arc_controller_namespace     = var.arc_controller_namespace
  arc_controller_chart_version = var.arc_controller_chart_version

  arc_runner_namespace     = var.arc_runner_namespace
  arc_runner_chart_version = var.arc_runner_chart_version

  githubConfigUrl                     = var.githubConfigUrl
  github_token                        = var.github_token
  maxRunners                          = var.maxRunners
  minRunners                          = var.minRunners
  containerModeType                   = var.containerModeType
  VolumeClaimAccessModes              = var.VolumeClaimAccessModes
  VolumeClaimStorageClassName         = var.VolumeClaimStorageClassName
  VolumeClaimResourcesRequestsStorage = var.VolumeClaimResourcesRequestsStorage

  depends_on = [
    module.action_cluster,
    module.actions_ebs_chart
  ]

}
