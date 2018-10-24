output "ecr_app1" {
  value = {
    name           = "${module.ecr_app1.name}"
    arn            = "${module.ecr_app1.arn}"
    registry_id    = "${module.ecr_app1.registry_id}"
    repository_url = "${module.ecr_app1.repository_url}"
  }
}

output "ecr_ro_policy_arn" {
  value = {
    arn = "${module.ecr_ro_policy.ecr_ro_arn}"
  }
}

output "ecr_ro_role" {
  value = {
    name = "${module.ecr_ro_role.name}"
  }
}

output "ecr_ro_group" {
  value = {
    name = "${module.ecr_ro_group.name}"
  }
}
