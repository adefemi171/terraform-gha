module "action_cluster" {
  source = "../actions-cluster"

  minikube_driver    = var.minikube_driver
  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  cluster_addons     = var.cluster_addons
  cluster_cpus       = var.cluster_cpus
  cluster_disk_size  = var.cluster_disk_size
  cluster_memory     = var.cluster_memory
  cluster_nodes      = var.cluster_nodes
}

module "actions_actions_arc_chart" {
  source                       = "../../actions-arc-dind-chart"
  arc_controller_namespace     = var.arc_controller_namespace
  arc_controller_chart_version = var.arc_controller_chart_version

  arc_runner_namespace     = var.arc_runner_namespace
  arc_runner_chart_version = var.arc_runner_chart_version
  arc_runner_config        = var.arc_runner_config

  depends_on = [
    module.action_cluster
  ]
}