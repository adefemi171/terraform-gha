# Cluster Config Variables
cluster_name                        = "actions-cluster"
cluster_version                     = "1.29"
cluster_endpoint_public_access      = true
ebs_role_name                       = "actions-sa"
managed_node_groups_name            = "actions-node-group"
node_group_defaults_instance_types  = ["t2.medium", "t3a.medium", "t3.xlarge"]
eks_managed_node_group_min_size     = 2
eks_managed_node_group_max_size     = 4
eks_managed_node_group_desired_size = 3
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

#EBS Chart Variables
ebs_chart_version  = "3.10.0"
open_ebs_namespace = "openebs"

#ARC Chart Variables
arc_controller_namespace     = "arc-systems"
arc_controller_chart_version = "0.7.0"

arc_runner_namespace     = "arc-runners"
arc_runner_chart_version = "0.7.0"

githubConfigUrl                     = "" # This is a dummy repo
github_token                        = "" # This is a dummy token
maxRunners                          = "2"
minRunners                          = "1"
containerModeType                   = "kubernetes"
VolumeClaimAccessModes              = "ReadWriteOnce"
VolumeClaimStorageClassName         = "dynamic-blob-storage"
VolumeClaimResourcesRequestsStorage = "1Gi"