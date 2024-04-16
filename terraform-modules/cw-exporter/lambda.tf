data "archive_file" "lambda_archive" {
  type        = "zip"
  source_file = "${path.module}/lambda/cw-to-s3.py"
  output_path = "${path.module}/lambda/tmp/cw-to-s3.zip"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "lambda_exec" {
  name = "cw-log-exporter-lambda-exec-role"
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

resource "aws_iam_role_policy" "log_exporter" {
  name   = "log-exporter-policy"
  role   = aws_iam_role.lambda_exec.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateExportTask",
        "logs:Describe*",
        "logs:ListTagsLogGroup"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "ssm:DescribeParameters",
        "ssm:GetParameter",
        "ssm:GetParameters",
        "ssm:GetParametersByPath",
        "ssm:PutParameter"
      ],
      "Resource": "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter/log-exporter-last-export/*",
      "Effect": "Allow"
    },
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/log-exporter-*",
      "Effect": "Allow"
    },
    {
        "Sid": "AllowCrossAccountObjectAcc",
        "Effect": "Allow",
        "Action": [
            "s3:PutObject",
            "s3:PutObjectACL"
        ],
        "Resource": "arn:aws:s3:::${var.bucket}/*"
    },
    {
        "Sid": "AllowCrossAccountBucketAcc",
        "Effect": "Allow",
        "Action": [
            "s3:PutBucketAcl",
            "s3:GetBucketAcl"
        ],
        "Resource": "arn:aws:s3:::${var.bucket}"
    }
  ]
}
EOF
}

resource "aws_lambda_function" "log_exporter" {
  function_name    = "cw-log-exporter"
  runtime          = "python3.10"
  handler          = "cw-to-s3.lambda_handler"
  filename         = data.archive_file.lambda_archive.output_path
  source_code_hash = data.archive_file.lambda_archive.output_base64sha256
  timeout          = 300
  role             = aws_iam_role.lambda_exec.arn
  environment {
    variables = {
      S3_BUCKET   = var.bucket
      AWS_ACCOUNT = data.aws_caller_identity.current.account_id
    }
  }
}

resource "aws_cloudwatch_event_rule" "log_exporter" {
  name        = "log-exporter-role"
  description = "Rule to trigger the log exporter lambda"
  #   schedule_expression = "rate(8 hours)"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "log_exporter" {
  rule      = aws_cloudwatch_event_rule.log_exporter.name
  target_id = "log-exporter"
  arn       = aws_lambda_function.log_exporter.arn
}

resource "aws_lambda_permission" "log_exporter_exec_cw" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.log_exporter.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.log_exporter.arn
}
