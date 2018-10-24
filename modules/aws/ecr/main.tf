provider "aws" {}

locals {
  repo_name = "${var.ecr_repo_prefix}/${var.env_type}_${var.app_name}_${var.app_version}"
}

resource "aws_ecr_repository" "ecr_repo" {
  name = "${local.repo_name}"
}
