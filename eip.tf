# Elastic IP

resource "aws_eip" "scpf_eip_a" {
  tags = {
    Name = "SCPF-EIP-A"
  }
}

resource "aws_eip" "scpf_eip_b" {
  tags = {
    Name = "SCPF-EIP-B"
  }
}

resource "aws_eip" "scpf_eip_c" {
  tags = {
    Name = "SCPF-EIP-C"
  }
}