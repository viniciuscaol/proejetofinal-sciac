# Internet Gateway

resource "aws_internet_gateway" "scpf_gw" {
  vpc_id = aws_vpc.scpf_vpc.id

  tags = {
    Name = "SCPF-IGW"
  }

  depends_on = [aws_vpc.scpf_vpc]
}

# Nat Gateway

resource "aws_nat_gateway" "scpf_natgw_a" {
  allocation_id = aws_eip.scpf_eip_a.id
  subnet_id     = aws_subnet.publica_a.id

  tags = {
    Name = "NATGW-A"
  }

  depends_on = [aws_subnet.publica_a]
}

resource "aws_nat_gateway" "scpf_natgw_b" {
  allocation_id = aws_eip.scpf_eip_b.id
  subnet_id     = aws_subnet.publica_b.id

  tags = {
    Name = "NATGW-B"
  }

  depends_on = [aws_subnet.publica_b]
}

resource "aws_nat_gateway" "scpf_natgw_c" {
  allocation_id = aws_eip.scpf_eip_c.id
  subnet_id     = aws_subnet.publica_c.id

  tags = {
    Name = "NATGW-C"
  }

  depends_on = [aws_subnet.publica_c]
}