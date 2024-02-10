output "actions_cluster_role_name_arn" {
  value = aws_iam_role.actions_cluster_role.arn
}

output "actions_ebs_service_role_arn" {
  value = module.ebs_service_role.iam_role_arn

}