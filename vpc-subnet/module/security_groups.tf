resource "aws_security_group" "ec2-sg" {
  name   = "${var.env}-public-sg"
  vpc_id = aws_vpc.vpc.id
  tags   = var.default_tags
}

# public out/egress
resource "aws_security_group_rule" "egress" {
  type        = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 0
  to_port     = 0
  protocol    = "-1"

  security_group_id = aws_security_group.ec2-sg.id
}

# ssh
resource "aws_security_group_rule" "ingress-ssh" {
  type        = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"

  security_group_id = aws_security_group.ec2-sg.id
}

# http
resource "aws_security_group_rule" "ingress-http" {
  type        = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"

  security_group_id = aws_security_group.ec2-sg.id
}

# https
resource "aws_security_group_rule" "ingress-https" {
  type        = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"

  security_group_id = aws_security_group.ec2-sg.id
}