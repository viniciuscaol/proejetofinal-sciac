# EC2 WebApp
resource "aws_instance" "webapp_a" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.publica_a.id
  vpc_security_group_ids      = [aws_security_group.http_sg.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/scripts/bootstrap.sh")

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "EC2 WebApp A"
  }
}

resource "aws_instance" "webapp_b" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.publica_b.id
  vpc_security_group_ids = [aws_security_group.http_sg.id]
  user_data              = file("${path.module}/scripts/bootstrap.sh")

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "EC2 WebApp B"
  }
}

resource "aws_instance" "webapp_c" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.publica_c.id
  vpc_security_group_ids = [aws_security_group.http_sg.id]
  user_data              = file("${path.module}/scripts/bootstrap.sh")

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "EC2 WebApp C"
  }
}