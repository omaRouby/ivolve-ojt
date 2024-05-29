provider "aws" {
  region = var.aws_region
}

module "networking" {
  source                 = "./modules/networking"
  vpc_cidr               = var.vpc_cidr
  vpc_name               = var.vpc_name
  public_subnet_cidr     = var.public_subnet_cidr
  private_subnet_cidrs   = var.private_subnet_cidrs
  availability_zones     = var.availability_zones
}

module "ec2" {
  source         = "./modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.networking.public_subnet_id
  key_name       = var.key_name
  instance_name  = "${var.vpc_name}-web"  # Adding instance_name variable
}


module "rds" {
  source                = "./modules/rds"
  db_engine_version     = var.db_engine_version
  db_identifier         = var.db_identifiers[0]  # Assuming using the first identifier in the list
  db_subnet_group_name  = "${var.vpc_name}-db-subnet-group"  # Using the same name as the subnet group
  db_instance_name      = "${var.vpc_name}-db"  # Providing a generic name for the RDS instance
  db_allocated_storage  = var.db_allocated_storage
  db_engine             = var.db_engine
  db_instance_class     = var.db_instance_class
  db_username           = var.db_username
  db_password           = var.db_password
}

