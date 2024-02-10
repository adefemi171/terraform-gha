variable "cluster_name" {}

variable "cluster_version" {}

variable "cluster_endpoint_public_access" {}

# variable "ebs_role_name" {}

variable "ebs_service_role_arn" {}

variable "managed_node_groups_name" {}

variable "vpc_id" {}

variable "private_subnet_ids" {}

variable "intra_subnet_ids" {}

variable "node_group_defaults_instance_types" {}

variable "eks_managed_node_group_min_size" {}

variable "eks_managed_node_group_max_size" {}

variable "eks_managed_node_group_desired_size" {}

variable "node_group_instance_types" {}

variable "create_aws_auth_configmap" {}

variable "manage_aws_auth_configmap" {}

variable "cluster_role_arn" {}

variable "enable_metrics_server" {}

variable "enable_kube_prometheus_stack" {}

variable "enable_aws_load_balancer_controller" {}

variable "region" {}

variable "environment" {}

variable "terraform_tag" {}
