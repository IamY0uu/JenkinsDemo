variable "region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "app_subnet_cidrs" {
  description = "List of app subnet CIDRs"
  type        = list(string)
}

variable "db_subnet_cidrs" {
  description = "List of DB subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI for EC2 app tier"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_pair" {
  description = "Key pair name"
  type        = string
}

variable "db_username" {
  description = "DB username"
  type        = string
}

variable "db_password" {
  description = "DB password"
  type        = string
  sensitive   = true
}
