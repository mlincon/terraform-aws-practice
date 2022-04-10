# Subnet
resource "aws_subnet" "private-subnet" {
  depends_on = [aws_vpc.vpc]
  vpc_id     = aws_vpc.vpc.id

  # 10.0.2.0/23
  cidr_block        = cidrsubnet(var.vpc_cidr_block, var.private_subnet_cidr_newbits, var.private_subnet_cidr_netnunm)
  availability_zone = var.subnet_availability_zone

  map_public_ip_on_launch = false

  tags = var.default_tags
}

# Associate NAT Gateway route table to this subnet
resource "aws_route_table_association" "private-rt-association" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.rt-nat.id
}