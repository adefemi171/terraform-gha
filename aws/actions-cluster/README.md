# Actions Cluster for AWS

This folder contains resources related to the actions-cluster functionality. This module sets up an action cluster on AWS using Terraform. It provisions an Amazon Elastic Kubernetes Service (EKS) cluster and manages the EKS managed node groups.

## Modules

### eks

This module provisions the EKS cluster and manages its configuration. It uses the `terraform-aws-modules/eks/aws` source and version `~> 19.21.0`. The following resources are created:

- EKS cluster: The main EKS cluster with the specified name and version.
- Cluster addons: CoreDNS, kube-proxy, vpc-cni, and aws-ebs-csi-driver addons are enabled for the cluster.
- VPC and subnets: The VPC and subnets where the EKS cluster will be deployed.
- EKS managed node group: A managed node group named "arc-node" is created with the specified instance types and scaling settings.
- aws-auth configmap: The configmap that maps IAM roles to Kubernetes RBAC roles.

### eks_blueprints_addons

This module installs additional addons on the EKS cluster created by the `eks` module. It uses the `aws-ia/eks-blueprints-addons/aws` source and version `~> 1.0`. The following addons are installed:

- Metrics Server: Enables collection of cluster metrics.
- Kube Prometheus Stack: Installs Prometheus and Grafana for monitoring the cluster.
- AWS Load Balancer Controller: Enables the use of AWS Load Balancer resources in the cluster.

## Resources

- `data "aws_caller_identity" "current"`: Retrieves the AWS account ID.
- `locals`: Defines local variables for the cluster name, version, and managed node groups name.

## Variables

The following variables are used in the module:

- `var.cluster_name`: The name of the EKS cluster.
- `var.cluster_version`: The version of the EKS cluster.
- `var.managed_node_groups_name`: The name of the managed node groups.
- `var.cluster_endpoint_public_access`: Whether the cluster endpoint should be publicly accessible.
- `var.vpc_id`: The ID of the VPC where the EKS cluster will be deployed.
- `var.private_subnet_ids`: The IDs of the private subnets where the EKS cluster will be deployed.
- `var.intra_subnet_ids`: The IDs of the subnets for the EKS control plane.
- `var.node_group_defaults_instance_types`: The instance types for the EKS managed node group.
- `var.eks_managed_node_group_min_size`: The minimum size of the EKS managed node group.
- `var.eks_managed_node_group_max_size`: The maximum size of the EKS managed node group.
- `var.eks_managed_node_group_desired_size`: The desired size of the EKS managed node group.
- `var.node_group_instance_types`: The instance types for the EKS managed node group.
- `var.create_aws_auth_configmap`: Whether to create the aws-auth configmap.
- `var.manage_aws_auth_configmap`: Whether to manage the aws-auth configmap.
- `var.cluster_role_arn`: The ARN of the IAM role for the EKS cluster.
- `var.enable_metrics_server`: Whether to enable the Metrics Server addon.
- `var.enable_kube_prometheus_stack`: Whether to enable the Kube Prometheus Stack addon.
- `var.enable_aws_load_balancer_controller`: Whether to enable the AWS Load Balancer Controller addon.
- `var.region`: The AWS region.
- `var.environment`: The environment name.
- `var.terraform_tag`: The Terraform tag.
