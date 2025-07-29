# ---------------- DB Subnet Group ----------------
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}

# ---------------- RDS Instance ----------------
resource "aws_db_instance" "rds" {
  identifier              = "three-tier-db"
  engine                  = "mysql"
  engine_version          = "8.0.36"
  instance_class          = var.db_instance_class
  allocated_storage       = var.allocated_storage
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [var.db_sg_id]
  skip_final_snapshot     = true
  publicly_accessible     = false

  tags = {
    Name = "rds-db-instance"
  }
}
