# Route Table Publica

resource "aws_route_table" "sc_rotapublica" {
  vpc_id = aws_vpc.scpf_vpc.id

  route {
    cidr_block = var.vpc-cidr
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.scpf_gw.id
  }

  tags = {
    Name = "Route Table Publica"
  }
}

# Associação da Route Table Publica com a Subrede Publica

resource "aws_route_table_association" "rotapublica_a" {
  subnet_id      = aws_subnet.publica_a.id
  route_table_id = aws_route_table.sc_rotapublica.id
  depends_on     = [aws_route_table.sc_rotapublica]
}

resource "aws_route_table_association" "rotapublica_b" {
  subnet_id      = aws_subnet.publica_b.id
  route_table_id = aws_route_table.sc_rotapublica.id
  depends_on     = [aws_route_table.sc_rotapublica]
}

resource "aws_route_table_association" "rotapublica_c" {
  subnet_id      = aws_subnet.publica_c.id
  route_table_id = aws_route_table.sc_rotapublica.id
  depends_on     = [aws_route_table.sc_rotapublica]
}

# Route Table Privada

resource "aws_route_table" "scrotaprivada_a" {
  vpc_id = aws_vpc.scpf_vpc.id

  route {
    cidr_block = var.vpc-cidr
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.scpf_natgw_a.id
  }

  tags = {
    Name = "Route Table Privada A"
  }
}

resource "aws_route_table" "scrotaprivada_b" {
  vpc_id = aws_vpc.scpf_vpc.id

  route {
    cidr_block = var.vpc-cidr
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.scpf_natgw_b.id
  }

  tags = {
    Name = "Route Table Privada B"
  }
}

resource "aws_route_table" "scrotaprivada_c" {
  vpc_id = aws_vpc.scpf_vpc.id

  route {
    cidr_block = var.vpc-cidr
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.scpf_natgw_c.id
  }

  tags = {
    Name = "Route Table Privada C"
  }
}

resource "aws_route_table_association" "rotaprivada_a" {
  subnet_id      = aws_subnet.privada_a.id
  route_table_id = aws_route_table.scrotaprivada_a.id
}

resource "aws_route_table_association" "rotaprivada_b" {
  subnet_id      = aws_subnet.privada_b.id
  route_table_id = aws_route_table.scrotaprivada_b.id
}

resource "aws_route_table_association" "rotaprivada_c" {
  subnet_id      = aws_subnet.privada_c.id
  route_table_id = aws_route_table.scrotaprivada_c.id
}

# Route Table RDS

resource "aws_route_table" "rotards" {
  vpc_id = aws_vpc.scpf_vpc.id

  route {
    cidr_block = var.vpc-cidr
    gateway_id = "local"
  }

  tags = {
    Name = "Route Table Banco RDS"
  }
}

resource "aws_route_table_association" "rotards_a" {
  subnet_id      = aws_subnet.rds_a.id
  route_table_id = aws_route_table.rotards.id
  depends_on     = [aws_route_table.rotards]
}

resource "aws_route_table_association" "rotards_b" {
  subnet_id      = aws_subnet.rds_b.id
  route_table_id = aws_route_table.rotards.id
  depends_on     = [aws_route_table.rotards]
}

resource "aws_route_table_association" "rotards_c" {
  subnet_id      = aws_subnet.rds_c.id
  route_table_id = aws_route_table.rotards.id
  depends_on     = [aws_route_table.rotards]
}