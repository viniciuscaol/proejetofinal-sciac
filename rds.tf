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

resource "aws_rds_cluster" "scada_rds" {
  cluster_identifier        = "scadadf-cluster"
  engine                    = "mysql"
  availability_zones        = var.availability_zone[*]
  database_name             = "scada_db"
  master_username           = "scada_user"
  master_password           = "scada_password"
  db_subnet_group_name      = aws_db_subnet_group.scdbsubgroup.name
  vpc_security_group_ids    = [aws_security_group.scada_sgrds.id]
  db_cluster_instance_class = "db.r6gd.xlarge"
  storage_type              = "io1"
  allocated_storage         = 400
  iops                      = 3000
  deletion_protection = false

  tags = {
    Name = "SC ADA RDS"
  }
}