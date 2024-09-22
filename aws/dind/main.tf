module "action_cluster" {
  source = "../actions-cluster"

  cluster_name                        = var.cluster_name
  cluster_version                     = var.cluster_version
  cluster_endpoint_public_access      = var.cluster_endpoint_public_access
  ebs_service_role_arn                = module.actions_role.actions_ebs_service_role_arn
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
  source = "../actions-network"

}

module "actions_role" {
  source = "../actions-role"

  actions_cluster_role_name     = var.actions_cluster_role_name
  ebs_role_name                 = var.ebs_role_name
  ebs_service_account_namespace = var.ebs_service_account_namespace
  ebs_service_account_name      = var.ebs_service_account_name
  cluster_oidc_provider_arn     = module.action_cluster.cluster_oidc_provider_arn
}

module "actions_actions_arc_chart" {
  source                       = "../../actions-arc-chart"
  arc_controller_namespace     = var.arc_controller_namespace
  arc_controller_chart_version = var.arc_controller_chart_version

  arc_runner_namespace     = var.arc_runner_namespace
  arc_runner_chart_version = var.arc_runner_chart_version
  arc_runner_config        = var.arc_runner_config

  depends_on = [
    module.action_cluster
  ]

}