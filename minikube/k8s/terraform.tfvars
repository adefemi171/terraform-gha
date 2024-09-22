# Cluster Config Variables
minikube_driver    = "docker"
cluster_name       = "actions-cluster"
kubernetes_version = "v1.30.0"
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

#EBS Chart Variables
ebs_chart_version  = "3.10.0"
open_ebs_namespace = "openebs"

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
  value = "kubernetes"
  }, {
  name  = "containerMode.kubernetesModeWorkVolumeClaim.accessModes[0]"
  value = "ReadWriteOnce"
  }, {
  name  = "containerMode.kubernetesModeWorkVolumeClaim.storageClassName"
  value = "openebs-hostpath"
  }, {
  name  = "containerMode.kubernetesModeWorkVolumeClaim.resources.requests.storage"
  value = "1Gi"
}]
