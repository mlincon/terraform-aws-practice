# VPC
# Routing table
# Internet Gateway
# NAT Gateway
# Elastic IP


# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  // if true, queueries the AWS DNS server at 169.254.169.253
  enable_dns_support = true

  // if true, instances with public IP addresses get corresponding public DNS 
  // hostnames only if enable_dns_support is also true
  enable_dns_hostnames = true

  tags = var.default_tags
}


# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = var.default_tags
}


# Routing Table for Internet Gateway
resource "aws_route_table" "rt-igw" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = var.default_tags
}


# Elastic IP (EIP) as you cannot launch NAT Gateway without EIP address associated with it 
resource "aws_eip" "nat-eip" {
  vpc = true

  tags = var.default_tags
}


# NAT (network address translation) Gateway
# allows instances in the private subnets to connect to the internet
# the NAT Gateway must be in the public subnet
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-subnet.id

  tags = var.default_tags
}


# Route table for NAT Gateway
resource "aws_route_table" "rt-nat" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = var.default_tags
}