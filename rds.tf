# RDS Subnet Group

resource "aws_db_subnet_group" "scdbsubgroup" {
  name = "scdbsubgroup"
  subnet_ids = [aws_subnet.rds_a.id,
    aws_subnet.rds_b.id,
    aws_subnet.rds_c.id
  ]

  tags = {
    Name = "SC DB Subnet Group"
  }
}

# RDS Projeto Final ADA

resource "aws_db_instance" "scada_mysql" {
  identifier = "scada-mysql"

  engine         = "mysql"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"
  storage_encrypted = true

  db_name                     = "scada_db"
  username                    = "scada_admin"
  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.scdbsubgroup.name
  vpc_security_group_ids = [aws_security_group.scada_sgrds.id]

  publicly_accessible = false
  multi_az            = false

  backup_retention_period    = 1
  auto_minor_version_upgrade = true

  # Configuração de laboratório:
  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    Name = "SCADA MySQL"
  }
}