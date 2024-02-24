variable "minikube_driver" {}

variable "cluster_name" {}

variable "kubernetes_version" {}

variable "cluster_addons" {
  default = []
}

variable "cluster_cpus" {}

variable "cluster_disk_size" {}

variable "cluster_memory" {}

variable "cluster_nodes" {}

#ARC Chart Variables
variable "arc_controller_namespace" {}

variable "arc_controller_chart_version" {}

variable "arc_runner_namespace" {}

variable "arc_runner_chart_version" {}

variable "arc_runner_config" {}
