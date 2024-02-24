variable "arc_controller_namespace" {}

variable "arc_controller_chart_version" {}

variable "arc_runner_namespace" {}

variable "arc_runner_chart_version" {}

variable "arc_runner_config" {
  type = list(object({
    name  = string
    value = string
  }))
}
