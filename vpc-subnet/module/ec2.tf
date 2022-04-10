# define a key for SSH login
resource "aws_key_pair" "ec2-key" {
  key_name = "ec2-ssh"
  public_key = file(var.ec2_key_name) 
}

# The EC2 is inside the public subet
resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.ec2_instance_type
  key_name      = aws_key_pair.ec2-key.key_name

  security_groups = [aws_security_group.ec2-sg.id]
  subnet_id       = aws_subnet.public-subnet.id

  // whether to associate public IP address with an instance in VPC
  associate_public_ip_address = true

  // start a webserver via user data
  user_data = file(var.ec2_user_data)

  tags = var.default_tags
}