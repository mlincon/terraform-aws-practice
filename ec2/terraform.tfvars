# General
region           = "eu-central-1"
profile          = "default"
credentials_file = "~/.aws/credentials"
default_tags = {
  Name : "EC2-SSH",
  project : "EC2-SSH"
}

# VPC
vpc_cidr_block = "10.0.0.0/16"
// http://jodies.de/ipcalc?host=10.0.0.0&mask1=16&mask2=
// 10.0.0.1 - 10.0.255.254
// (2^[32-16]) - 2 = 65,534 available IP addresses


# subnet
subnet_availability_zone = "eu-central-1a"

# EC2
ami_id            = "ami-0502e817a62226e03" // Ubuntu Server 20.04 LTS (HVM)
ec2_instance_type = "t2.micro"
pem_key_name      = "ec2-ssh"