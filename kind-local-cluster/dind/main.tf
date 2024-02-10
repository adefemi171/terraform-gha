module "action_cluster" {
  source = "../actions-cluster"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  kind               = var.kind
  api_version        = var.api_version
}

module "actions_actions_arc_chart" {
  source                       = "../../actions-arc-dind-chart"
  arc_controller_namespace     = var.arc_controller_namespace
  arc_controller_chart_version = var.arc_controller_chart_version

  arc_runner_namespace     = var.arc_runner_namespace
  arc_runner_chart_version = var.arc_runner_chart_version

  githubConfigUrl   = var.githubConfigUrl
  github_token      = var.github_token
  maxRunners        = var.maxRunners
  minRunners        = var.minRunners
  containerModeType = var.containerModeType

  depends_on = [
    module.action_cluster
  ]
}