variable "application_name" {
  description = "Name of the CodeDeploy application"
  type        = string
}

variable "deployment_group_name" {
  description = "Name of the CodeDeploy deployment group"
  type        = string
}

variable "iam_role_name" {
  description = "IAM Role name for CodeDeploy"
  type        = string
}

variable "ec2_tag_key" {
  description = "Tag key used to identify target EC2 instances"
  type        = string
}

variable "ec2_tag_value" {
  description = "Tag value used to identify target EC2 instances"
  type        = string
}

