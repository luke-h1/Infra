variable "bucket" {
  type        = string
  description = "The name of the S3 bucket where the CloudWatch logs will be exported to"
  default     = "cw-logs-lho"
}
