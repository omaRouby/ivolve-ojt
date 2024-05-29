resource "aws_db_instance" "db" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  identifier           = var.db_identifier
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = var.db_subnet_group_name

  skip_final_snapshot = true

  tags = {
    Name = var.db_instance_name
  }
}

