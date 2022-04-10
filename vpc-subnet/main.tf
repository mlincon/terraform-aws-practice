locals {
  ec2_user_data = "${path.module}/${var.ec2_user_data}"
  ec2_key_name = "${path.module}/${var.ec2_key_name}"
}


module "public-private-subnet" {

  source = "./module"

  # General
  env          = "dev"
  default_tags = var.default_tags

  # VPC
  vpc_cidr_block              = var.vpc_cidr_block
  public_subnet_cidr_newbits  = 8
  public_subnet_cidr_netnunm  = 0
  private_subnet_cidr_newbits = 7
  private_subnet_cidr_netnunm = 1

  # subnet
  subnet_availability_zone = var.subnet_availability_zone

  # EC2
  ami_id            = var.ami_id
  ec2_instance_type = var.ec2_instance_type
  ec2_user_data     = local.ec2_user_data
  ec2_key_name      = local.ec2_key_name

}