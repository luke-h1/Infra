resource "aws_iam_user" "prometheus_iam" {
  name = var.prometheus_access_name
}
