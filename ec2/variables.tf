# General variable

variable "region" {
  type        = string
  description = "AWS region"
}

variable "profile" {
  type        = string
  description = "AWS profile"
}

variable "credentials_file" {
  type        = string
  description = "Path to the AWS credentials file"
}

variable "default_tags" {
  type        = map
  description = "Default tags in key-value pairs"
}

# VPC

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

# subset
variable "subnet_availability_zone" {
  type        = string
  description = "The AZ for subnet"
}

# EC2 instance
variable "ami_id" {
  type        = string
  description = "The AMI to use for the instance"
}

variable "ec2_instance_type" {
  type        = string
  description = "The type of instance to start"
}

variable "pem_key_name" {
  type        = string
  description = "The key name of the Key Pair to use for the instance"
}









