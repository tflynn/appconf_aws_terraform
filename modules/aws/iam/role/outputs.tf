output "name" {
  value = "${local.role_name}"
}

output "arn" {
  value = "${aws_iam_role.role.arn}"
}

output "create_date" {
  value = "${aws_iam_role.role.create_date}"
}

output "unique_id" {
  value = "${aws_iam_role.role.unique_id}"
}

output "description" {
  value = "${aws_iam_role.role.description}"
}
