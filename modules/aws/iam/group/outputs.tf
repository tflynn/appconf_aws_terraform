output "name" {
  value = "${local.group_name}"
}

output "id" {
  value = "${aws_iam_group.group.id}"
}

output "arn" {
  value = "${aws_iam_group.group.arn}"
}

output "path" {
  value = "${aws_iam_group.group.path}"
}

output "unique_id" {
  value = "${aws_iam_group.group.unique_id}"
}
