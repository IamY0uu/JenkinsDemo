variable "vpc_id" {
  description = "VPC in which to create the ALB"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "web_sg_id" {
  description = "Security group ID for ALB"
  type        = string
}
