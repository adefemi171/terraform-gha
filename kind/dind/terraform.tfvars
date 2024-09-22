# Cluster Config Variables
cluster_name       = "actions-cluster"
kubernetes_version = "v1.30.4"
kind               = "Cluster"
api_version        = "kind.x-k8s.io/v1alpha4"

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
