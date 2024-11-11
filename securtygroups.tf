# Securty Group HTTP EC2
resource "aws_security_group" "http_sg" {
  vpc_id = aws_vpc.scpf_vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.scpf_vpc.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "HTTP SG"
  }

  depends_on = [aws_vpc.scpf_vpc]
}

# Securty Group RDS
resource "aws_security_group" "scada_sgrds" {
  vpc_id = aws_vpc.scpf_vpc.id
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.http_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SC ADA SGRDS"
  }
}

