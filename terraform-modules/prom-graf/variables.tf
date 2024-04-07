variable "aws_region" {
  type        = string
  description = "The AWS region to deploy the resources in"
  default     = "eu-west-2"
}

variable "aws_availability_zone" {
  type        = string
  description = "The AWS availability zone to deploy the resources in"
  default     = "eu-west-2a"
}

variable "aws_instance_type" {
  type        = string
  description = "Instance type to use for the EC2 instance"
  default     = "t2.nano"
}

variable "aws_public_key_name" {
  type        = string
  description = "The name of the public key for the prometheus EC2 instance"
  default     = "prometheus_aws_rsa"
}

variable "prometheus_access_name" {
  type        = string
  description = "The name of the IAM user for Prometheus"
  default     = "prometheus_ec2_access"
}

# ubuntu 22.04
variable "aws_amis" {
  type        = map(string)
  description = "The AMIs to use for the EC2 instances"
  default = {
    eu-west-2 = "ami-0b9932f4918a00c4f"
  }
}

variable "name" {
  type        = string
  description = "The name to give to the ec2 instance"
  default     = "Prometheus_server"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "11.0.0.0/16"
}

variable "prometheus_server_subnet_cidr1" {
  type        = string
  description = "The CIDR block for the prometheus server"
  default     = "11.0.1.0/24"
}

variable "env" {
  type        = string
  description = "The environment to deploy the resources in"
  default     = "live"
}
