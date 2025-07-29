variable "db_subnet_ids" {
  description = "List of DB subnet IDs"
  type        = list(string)
}

variable "db_sg_id" {
  description = "Security Group ID for DB"
  type        = string
}

variable "db_username" {
  description = "Username for RDS"
  type        = string
}

variable "db_password" {
  description = "Password for RDS"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "RDS storage (GB)"
  type        = number
  default     = 20
}
