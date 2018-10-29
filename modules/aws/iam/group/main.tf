provider "aws" {}

locals {
  group_name = "${var.env_type}_${var.group_name}"
}

resource "aws_iam_group" "group" {
  name = "${local.group_name}"

  # Ignore errors to allow this to rerun without issues
  provisioner "local-exec" {
    command = "destroy_iam_group_and_dependencies.py ${local.group_name} skip_group_destroy"
    when    = "destroy"
  }
}

resource "aws_iam_group_policy_attachment" "attach" {
  group      = "${local.group_name}"
  policy_arn = "${var.policy_arn}"
}
