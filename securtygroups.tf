# Securty Group HTTP EC2
resource "aws_security_group" "http_sg" {
  vpc_id = aws_vpc.scpf_vpc.id
  ingress {
    description     = "HTTP recebido do Application Load Balancer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
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

# Entrada HTTP do Application Load Balancer
resource "aws_security_group" "alb_sg" {
  name_prefix = "scada-alb-"
  description = "Acesso HTTP ao Application Load Balancer"
  vpc_id      = aws_vpc.scpf_vpc.id

  ingress {
    description = "HTTP dos visitantes"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTP para as instancias na VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.scpf_vpc.cidr_block]
  }

  tags = {
    Name = "SCADA ALB SG"
  }
}
