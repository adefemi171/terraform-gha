# Cluster Config Variables
cluster_name       = "actions-cluster"
kubernetes_version = "v1.29.1"
kind               = "Cluster"
api_version        = "kind.x-k8s.io/v1alpha4"

#ARC Chart Variables
arc_controller_namespace     = "arc-systems"
arc_controller_chart_version = "0.7.0"

arc_runner_namespace     = "arc-runners"
arc_runner_chart_version = "0.7.0"

githubConfigUrl                     = "https://github.com/" # This is a dummy repo
github_token                        = "ghp_3"               # This is a dummy token
maxRunners                          = "3"
minRunners                          = "1"
containerModeType                   = "dind"
