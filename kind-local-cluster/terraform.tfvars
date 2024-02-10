# Cluster Config Variables
cluster_name       = "actions-cluster"
kubernetes_version = "v1.29.1@sha256:a0cc28af37cf39b019e2b448c54d1a3f789de32536cb5a5db61a49623e527144"
kind               = "Cluster"
api_version        = "kind.x-k8s.io/v1alpha4"


#EBS Chart Variables
ebs_chart_version  = "3.10.0"
open_ebs_namespace = "openebs"

#ARC Chart Variables
arc_controller_namespace     = "arc-systems"
arc_controller_chart_version = "0.7.0"

arc_runner_namespace     = "arc-runners"
arc_runner_chart_version = "0.7.0"

githubConfigUrl                     = "https://github.com/"     # This is a dummy repo
github_token                        = "ghp_3" # This is a dummy token
maxRunners                          = "3"
minRunners                          = "1"
containerModeType                   = "kubernetes"
VolumeClaimAccessModes              = "ReadWriteOnce"
VolumeClaimStorageClassName         = "openebs-hostpath"
VolumeClaimResourcesRequestsStorage = "1Gi"
