variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance"
  type        = number
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
}

variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "db_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "db_username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "The master password for the RDS instance"
  type        = string
}

variable "db_subnet_group_name" {
  description = "The name of the RDS subnet group"
  type        = string
}

variable "db_instance_name" {
  description = "The name of the RDS instance"
  type        = string
}

