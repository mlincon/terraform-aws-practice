module "ec2-ssh" {
  source = "./ec2"

  # General
  default_tags = var.default_tags

  # VPC
  vpc_cidr_block = var.vpc_cidr_block

  # subnet
  subnet_availability_zone = var.subnet_availability_zone

  # EC2
  ami_id            = var.ami_id
  ec2_instance_type = var.ec2_instance_type
  pem_key_name      = var.pem_key_name
}
