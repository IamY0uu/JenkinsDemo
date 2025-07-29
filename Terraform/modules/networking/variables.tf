variable "vpc_id" {
  description = "VPC ID to associate resources with"
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
  description = "List of db subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  description = "AZs for each subnet pair"
  type        = list(string)
}
