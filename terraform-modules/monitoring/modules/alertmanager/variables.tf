variable "hostname" {
  type        = string
  description = "The hostname of the Alertmanager instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t2.nano"
}

variable "instance_ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0c618421e207909d0"
}

variable "instance_profile" {
  type        = string
  description = "IAM instance profile for the EC2 instance"
}

variable "key_name" {
  type        = string
  description = "Key name for the EC2 instance"
}

variable "config_bucket_name" {
  type        = string
  description = "S3 bucket name for the Alertmanager configuration"
}

variable "password" {
  type        = string
  description = "Password for the Alertmanager web interface"
}

variable "letsencrypt_email" {
  type        = string
  description = "Email address for Let's Encrypt certificate"
}

variable "security_group_name" {
  type        = string
  description = "Name of the security group for the EC2 instance"
}
