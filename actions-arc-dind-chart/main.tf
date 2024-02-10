resource "helm_release" "actions_arc_controller" {
  namespace        = var.arc_controller_namespace
  create_namespace = true

  name       = "arc-systems"
  repository = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart      = "gha-runner-scale-set-controller"
  version    = var.arc_controller_chart_version
}

resource "helm_release" "actions_arc_runner" {
  namespace        = var.arc_runner_namespace
  create_namespace = true

  name       = "arc-runners"
  repository = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart      = "gha-runner-scale-set"
  version    = var.arc_runner_chart_version

  set {
    name  = "githubConfigUrl"
    value = var.githubConfigUrl
  }

  set {
    name  = "githubConfigSecret.github_token"
    value = var.github_token
  }

  set {
    name  = "maxRunners"
    value = var.maxRunners
  }

  set {
    name  = "minRunners"
    value = var.minRunners
  }

  set {
    name  = "containerMode.type"
    value = var.containerModeType
  }

  depends_on = [helm_release.actions_arc_controller]
}
