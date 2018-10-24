module "ecr_app1" {
  source = "../modules/aws/ecr"

  env_type    = "${var.env_type}"
  app_name    = "app1"
  app_version = "0.1"
}

locals = {
  ecr_ro_arn_list  = "${list("${module.ecr_app1.arn}")}"
  ecr_ro_resources = "${join(",", local.ecr_ro_arn_list) }"
}

module "ecr_ro_policy" {
  source = "../modules/aws/iam/policy"

  env_type    = "${var.env_type}"
  policy_name = "ecr_ro"
  resources   = "${local.ecr_ro_resources}"
}

module "ecr_ro_role" {
  source = "../modules/aws/iam/role"

  env_type   = "${var.env_type}"
  role_name  = "ecr_ro"
  policy_arn = "${module.ecr_ro_policy.ecr_ro_arn}"
}

module "ecr_ro_group" {
  source = "../modules/aws/iam/group"

  env_type   = "${var.env_type}"
  group_name = "ecr_ro"
  policy_arn = "${module.ecr_ro_policy.ecr_ro_arn}"
}
