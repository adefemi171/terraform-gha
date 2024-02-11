# Cluster Config Variables
minikube_driver    = "docker"
cluster_name       = "actions-cluster"
kubernetes_version = "v1.28.3"
cluster_addons = [
  "ingress",
  "metrics-server",
  "dashboard",
  "storage-provisioner",
  "default-storageclass",
]
cluster_cpus      = 4
cluster_disk_size = "50g"
cluster_memory    = "8192"
cluster_nodes     = "3"

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