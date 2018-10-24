output "sts_assume_role_json" {
  value = "${local.sts_assume_role_output}"
}

output "ecr_ro_arn" {
  value = "${local.ecr_ro_arn}"
}
