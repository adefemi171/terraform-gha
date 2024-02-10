resource "helm_release" "actions_open_ebs" {
  namespace        = var.open_ebs_namespace
  create_namespace = true

  name       = "openebs"
  repository = "https://openebs.github.io/charts"
  chart      = "openebs"
  version    = var.ebs_chart_version

  set {
    name  = "ndm.enabled"
    value = "false"
  }

  set {
    name  = "ndmOperator.enabled"
    value = "false"
  }

  set {
    name  = "snapshotOperator.enabled"
    value = "false"
  }

  set {
    name  = "webhook.enabled"
    value = "false"
  }

  set {
    name  = "localprovisioner.enabledDeviceClass"
    value = "false"
  }

  set {
    name  = "localprovisioner.hostpathClass.name"
    value = "openebs-hostpath"
  }
}
