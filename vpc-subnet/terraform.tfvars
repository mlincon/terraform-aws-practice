# General
env              = "dev"
region           = "eu-central-1"
profile          = "default"
credentials_file = "~/.aws/credentials"
default_tags = {
  Name : "Public-private-subnets",
  project : "Public-private-subnets"
}

# VPC
vpc_cidr_block = "10.0.0.0/16"

# subnet
subnet_availability_zone    = "eu-central-1a"
public_subnet_cidr_newbits  = 8
public_subnet_cidr_netnunm  = 0
private_subnet_cidr_newbits = 7
private_subnet_cidr_netnunm = 1

# EC2
ami_id            = "ami-0dcc0ebde7b2e00db" // Amazon Linux 2 (HVM)
ec2_instance_type = "t2.micro"
ec2_user_data     = "user_data/user_data.sh"
pem_key_name      = "ec2-ssh"