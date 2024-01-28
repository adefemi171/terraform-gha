resource "helm_release" "actions_open_ebs" {
  namespace        = var.open_ebs_namespace
  create_namespace = true

  name       = "openebs"
  repository = "https://openebs.github.io/charts"
  chart      = "openebs"
  version    = var.ebs_chart_version
}
