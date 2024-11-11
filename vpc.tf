# VPC

resource "aws_vpc" "scpf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Projeto Final Ada IaC"
  }
}

# Subrede Publica

resource "aws_subnet" "publica_a" {
  vpc_id            = aws_vpc.scpf_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Sub Publica A"
  }

}

resource "aws_subnet" "publica_b" {
  vpc_id            = aws_vpc.scpf_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Sub Publica B"
  }

}

resource "aws_subnet" "publica_c" {
  vpc_id            = aws_vpc.scpf_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Sub Publica C"
  }

}

# Subrede privada

resource "aws_subnet" "privada_a" {
  vpc_id            = aws_vpc.scpf_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Sub Privada A"
  }

}

resource "aws_subnet" "privada_b" {
  vpc_id            = aws_vpc.scpf_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Sub Privada B"
  }

}

resource "aws_subnet" "privada_c" {
  vpc_id            = aws_vpc.scpf_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Sub Privada C"
  }

}

# Subrede RDS

resource "aws_subnet" "rds_a" {
  vpc_id            = aws_vpc.scpf_vpc.id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Sub RDS A"
  }

}

resource "aws_subnet" "rds_b" {
  vpc_id            = aws_vpc.scpf_vpc.id
  cidr_block        = "10.0.8.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Sub RDS B"
  }

}

resource "aws_subnet" "rds_c" {
  vpc_id            = aws_vpc.scpf_vpc.id
  cidr_block        = "10.0.9.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Sub RDS C"
  }
}

