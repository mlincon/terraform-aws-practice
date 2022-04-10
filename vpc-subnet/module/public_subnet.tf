# Subnet
resource "aws_subnet" "public-subnet" {
  depends_on = [aws_vpc.vpc]
  vpc_id     = aws_vpc.vpc.id

  # Set CIDR block to 10.0.0.0/24
  cidr_block = cidrsubnet(var.vpc_cidr_block, var.public_subnet_cidr_newbits, var.public_subnet_cidr_netnunm)

  availability_zone = var.subnet_availability_zone

  # (EC2) instances launched into the subnet gets public IP address
  # this corresponds to the "Enable auto-assign public IPv4 address" option
  map_public_ip_on_launch = true

  tags = var.default_tags
}

# Associate route table to subnet
# does not have a tags option
resource "aws_route_table_association" "public-rt-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rt-igw.id
}