provider "aws" {}

data "template_file" "sts_assume_role" {
  template = "${file("${path.module}/templates/sts_assume_role.json.tpl")}"

  vars {
    principal_service = "${var.sts_assume_role_principal_service}"
  }
}

data "aws_iam_policy_document" "ecr_ro" {
  statement {
    sid    = "1"
    effect = "Allow"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
    ]

    resources = ["${var.resources}"]
  }

  statement {
    sid    = "2"
    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken",
    ]

    resources = ["*"]
  }
}

locals {
  policy_name_present = "${length(var.policy_name) == 0 ? 0 : 1}"
}

# Handle conditional call and results for creation of policy "ecr_ro"

locals {
  use_ecr_ro = "${local.policy_name_present && var.policy_name == "ecr_ro" ? 1 : 0}"
}

resource "aws_iam_policy" "ecr_ro" {
  count       = "${local.use_ecr_ro ? 1 : 0}"
  name        = "ecr_ro_${var.env_type}"
  path        = "/"
  description = "ECR RO policy (${var.env_type})"

  policy = "${data.aws_iam_policy_document.ecr_ro.json}"
}

# All because 'aws_iam_policy.ecr_ro.*.arn' throws an error if the resource call doesn't execute
locals {
  ecr_ro_results = "${compact(concat(list("skip"), aws_iam_policy.ecr_ro.*.arn))}"
  ecr_ro_arn     = "${length(local.ecr_ro_results) == 1 ? "": "${element(local.ecr_ro_results,1)}" }"
}

# Handle conditional call and results for creation of policy "sts_assume_role"

locals {
  use_sts_assume_role    = "${local.policy_name_present && var.policy_name == "sts_assume_role" ? 1 : 0}"
  sts_assume_role_json   = "${data.template_file.sts_assume_role.rendered}"
  sts_assume_role_output = "${local.use_sts_assume_role ? "${local.sts_assume_role_json}" : ""}"
}
