data "archive_file" "lambda_archive" {
  type        = "zip"
  source_dir  = "${path.module}/../lambda"
  output_path = "${path.module}/bootstrap.zip"
}

resource "aws_lambda_function" "cloudwatch_exporter" {
  function_name    = "cloudwatch-exporter"
  description      = "Lambda function to export cloudwatch logs to s3"
  handler          = "main"
  filename         = data.archive_file.lambda_archive.output_path
  source_code_hash = data.archive_file.lambda_archive.output_base64sha256
  runtime          = "provided.al2023"
  role             = aws_iam_role.lambda_role.arn
}


locals {
  permissions = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  ]
}

resource "aws_iam_role" "lambda_role" {
  name = "AWSCloudWatchExporter"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachments" {
  for_each = toset(local.permissions)

  role       = aws_iam_role.lambda_role.name
  policy_arn = each.value
}
