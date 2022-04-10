# General variable
variable "env" {
  type        = string
  description = "The development environment"
  default     = "dev"
}

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
  type        = map(any)
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

variable "public_subnet_cidr_newbits" {
  type        = number
  description = "The newbits argument for cidrsubnet expression"
}

variable "public_subnet_cidr_netnunm" {
  type        = number
  description = "The netnum argument for cidrsubnet expression"
}

variable "private_subnet_cidr_newbits" {
  type        = number
  description = "The newbits argument for cidrsubnet expression"
}

variable "private_subnet_cidr_netnunm" {
  type        = number
  description = "The netnum argument for cidrsubnet expression"
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

variable "ec2_user_data" {
  type        = string
  description = "The name of the user data file"
}

variable "ec2_key_name" {
  type        = string
  description = "The key name of the Key Pair to use for the instance"
}