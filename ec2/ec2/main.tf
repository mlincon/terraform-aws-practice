// vpc
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "ec2-vpc" {
  // IP range for the VPC
  cidr_block           = var.vpc_cidr_block

  // instances with a public IP address receive corresponding public DNS hostnames
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags                 = var.default_tags
}


// subnet (public)
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "ec2-vpc-sn" {
  // IP range for the public subnet
  cidr_block        = cidrsubnet(aws_vpc.ec2-vpc.cidr_block, 3, 1) // 10.0.32.0/19

  // VPC in whichc the subnet has to be created
  vpc_id            = aws_vpc.ec2-vpc.id

  // instances launched into the subnet should be assigned a public IP address
  map_public_ip_on_launch = true

  availability_zone = var.subnet_availability_zone
  depends_on        = aws_vpc.ec2-vpc
  tags              = var.default_tags
}


// security group
// - manage traffic at the server/resource level
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "ec2-vpc-sg" {
  name   = "allow-all-sg"

  // VPC in which the security group is created
  vpc_id = aws_vpc.ec2-vpc.id 
  
  // inbound rules #1: SSH
  ingress {
    cidr_blocks = ["0.0.0.0/0"] // use to specify the source, here allow all
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  // outbound rules #1: All traffic
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = var.default_tags
}


// internet gateway: to route traffic from internet to VPC
// - allows external users to communicate with parts of the VPC
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "ec2-vpc-igw" {
  // VPC in which the security group will be created
  vpc_id = aws_vpc.ec2-vpc.id

  tags   = var.default_tags
}


// routing table
// - regulate traffic to and from the network based on set of entries or rules
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "ec2-rt" {
  vpc_id = aws_vpc.ec2-vpc.id

  // divert all traffic through the VPC internet gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2-vpc-igw.id
  }

  tags = var.default_tags
}


// - create an association between the subnet and the route table
// - this will expose the subnet to the internet for access
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "ec2-rt-association" {
  subnet_id      = aws_subnet.ec2-vpc-sn.id
  route_table_id = aws_route_table.ec2-rt.id
}


// create the EC2
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "ec2-main" {
  ami                         = var.ami_id
  instance_type               = var.ec2_instance_type
  key_name                    = var.pem_key_name
  security_groups             = [aws_security_group.ec2-vpc-sg.id]
  subnet_id                   = aws_subnet.ec2-vpc-sn.id

  // associate a public ip address with an instance in a VPC
  associate_public_ip_address = true 

  tags                        = var.default_tags
}

// elastic ip
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
resource "aws_eip" "ec2-elastic-ip" {
  instance = aws_instance.ec2-main.id
  vpc      = true
  tags     = var.default_tags
}