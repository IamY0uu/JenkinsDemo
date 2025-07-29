variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "app_sg_id" {
  description = "Security Group ID for App tier"
  type        = string
}

variable "app_subnet_ids" {
  description = "Subnets to deploy the ASG instances into"
  type        = list(string)
}

variable "target_group_arn" {
  description = "Target Group ARN to attach with ASG"
  type        = string
}
