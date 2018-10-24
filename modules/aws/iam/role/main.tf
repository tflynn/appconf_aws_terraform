provider "aws" {}

module "sts_assume_role" {
  source = "../policy"

  env_type    = "${var.env_type}"
  policy_name = "sts_assume_role"
}

locals {
  role_name = "${var.env_type}_${var.role_name}"
}

resource "aws_iam_role" "role" {
  name        = "${local.role_name}"
  description = "${local.role_name}"

  assume_role_policy = "${module.sts_assume_role.sts_assume_role_json}"

  force_detach_policies = 1
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = "${local.role_name}"
  policy_arn = "${var.policy_arn}"
}
