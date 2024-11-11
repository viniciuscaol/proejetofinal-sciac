# EC2 WebApp
resource "aws_instance" "webapp_a" {
  ami             = "ami-06b21ccaeff8cd686"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.publica_a.id
  security_groups = [aws_security_group.http_sg.id]

  tags = {
    Name = "EC2 WebApp A"
  }
}

resource "aws_instance" "webapp_b" {
  ami             = "ami-06b21ccaeff8cd686"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.publica_b.id
  security_groups = [aws_security_group.http_sg.id]

  tags = {
    Name = "EC2 WebApp B"
  }
}

resource "aws_instance" "webapp_c" {
  ami             = "ami-06b21ccaeff8cd686"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.publica_c.id
  security_groups = [aws_security_group.http_sg.id]

  tags = {
    Name = "EC2 WebApp C"
  }
}