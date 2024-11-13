# EC2 WebApp
resource "aws_instance" "webapp_a" {
  ami             = var.ec2_ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.publica_a.id
  security_groups = [aws_security_group.http_sg.id]

  tags = {
    Name = "EC2 WebApp A"
  }
}

resource "aws_instance" "webapp_b" {
  ami             = var.ec2_ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.publica_b.id
  security_groups = [aws_security_group.http_sg.id]

  tags = {
    Name = "EC2 WebApp B"
  }
}

resource "aws_instance" "webapp_c" {
  ami             = var.ec2_ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.publica_c.id
  security_groups = [aws_security_group.http_sg.id]

  tags = {
    Name = "EC2 WebApp C"
  }
}