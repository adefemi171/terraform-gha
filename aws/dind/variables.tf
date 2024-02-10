# Cluster Config Variables
variable "cluster_name" {}

variable "cluster_version" {}

variable "cluster_endpoint_public_access" {}

variable "managed_node_groups_name" {}

variable "node_group_defaults_instance_types" {}

variable "eks_managed_node_group_min_size" {}

variable "eks_managed_node_group_max_size" {}

variable "eks_managed_node_group_desired_size" {}

variable "node_group_instance_types" {}

variable "create_aws_auth_configmap" {}

variable "manage_aws_auth_configmap" {}

variable "enable_metrics_server" {}

variable "enable_kube_prometheus_stack" {}

variable "enable_aws_load_balancer_controller" {}

variable "region" {}

variable "environment" {}

variable "terraform_tag" {}

#EKS Role Variables
variable "actions_cluster_role_name" {}

variable "ebs_role_name" {}

variable "ebs_service_account_namespace" {}

variable "ebs_service_account_name" {}

#ARC Chart Variables
variable "arc_controller_namespace" {}

variable "arc_controller_chart_version" {}

variable "arc_runner_namespace" {}

variable "arc_runner_chart_version" {}

variable "githubConfigUrl" {}

variable "github_token" {}

variable "maxRunners" {}

variable "minRunners" {}

variable "containerModeType" {}
