variable "cluster_name" {}

variable "kubernetes_version" {}

variable "kind" {}

variable "api_version" {}

#EBS Chart Variables
variable "open_ebs_namespace" {}

variable "ebs_chart_version" {}

#ARC Chart Variables
variable "arc_controller_namespace" {}

variable "arc_controller_chart_version" {}

variable "arc_runner_namespace" {}

variable "arc_runner_chart_version" {}

variable "arc_runner_config" {}
