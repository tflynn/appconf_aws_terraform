data "external" "aws_conf" {
  program = ["python", "${path.module}/aws_conf.py"]
  query   = {}
}
