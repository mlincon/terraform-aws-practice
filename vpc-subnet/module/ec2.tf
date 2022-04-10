# The EC2 is inside the public subet
resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.ec2_instance_type
  key_name      = var.pem_key_name

  security_groups = [aws_security_group.ec2-sg.id]
  subnet_id       = aws_subnet.public-subnet.id

  // whether to associate public IP address with an instance in VPC
  associate_public_ip_address = true

  // start a webserver via user data
  user_data = file("${path.module}/user_data/user_data.sh")

  tags = var.default_tags
}