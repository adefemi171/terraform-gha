# Cluster Config Variables
cluster_name                        = "actions-cluster"
cluster_version                     = "1.30"
cluster_endpoint_public_access      = true
managed_node_groups_name            = "actions-node-group"
node_group_defaults_instance_types  = ["t2.medium", "t3a.medium", "t3.xlarge"]
eks_managed_node_group_min_size     = 1
eks_managed_node_group_max_size     = 3
eks_managed_node_group_desired_size = 2
node_group_instance_types           = ["t3.xlarge"]
create_aws_auth_configmap           = false
manage_aws_auth_configmap           = true

# Cluster Addons Variables
enable_metrics_server               = true
enable_kube_prometheus_stack        = true
enable_aws_load_balancer_controller = true

environment   = "dev"
terraform_tag = "true"
region        = "us-east-1"

# EKS Role Variables
actions_cluster_role_name     = "actions-cluster-role"
ebs_role_name                 = "actions-sa"
ebs_service_account_namespace = "kube-system"
ebs_service_account_name      = "ebs-controller-sa"

#ARC Chart Variables
arc_controller_namespace     = "arc-systems"
arc_controller_chart_version = "0.9.3"

arc_runner_namespace     = "arc-runners"
arc_runner_chart_version = "0.9.3"
arc_runner_config = [{
  name  = "githubConfigUrl"
  value = "https://github.com/" # This is a dummy repo
  }, {
  name  = "githubConfigSecret.github_token"
  value = "ghp_3" # This is a dummy token
  }, {
  name  = "maxRunners"
  value = "3"
  }, {
  name  = "minRunners"
  value = "1"
  }, {
  name  = "containerMode.type"
  value = "dind"
}]
