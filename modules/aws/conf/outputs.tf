output "region" {
  value = "${data.external.aws_conf.result["region"]}"
}

output "aws_access_key_id" {
  value = "${data.external.aws_conf.result["aws_access_key_id"]}"
}

output "aws_secret_access_key" {
  value = "${data.external.aws_conf.result["aws_secret_access_key"]}"
}
