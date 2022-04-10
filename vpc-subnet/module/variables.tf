# General
variable "env" {
  type        = string
  description = "The development environment"
  default     = "dev"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags in key-value pairs"
  default     = {}
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

variable "pem_key_name" {
  type        = string
  description = "The key name of the Key Pair to use for the instance"
}