
variable "bucket" {
  type        = string
  description = "The s3 bucket to export cloudwatch logs to"
  default     = "cw-logs-lho"
}

