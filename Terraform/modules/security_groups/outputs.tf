output "web_sg_id" {
  description = "Security Group ID for Web Tier"
  value       = aws_security_group.web_sg.id
}

output "app_sg_id" {
  description = "Security Group ID for App Tier"
  value       = aws_security_group.app_sg.id
}

output "db_sg_id" {
  description = "Security Group ID for DB Tier"
  value       = aws_security_group.db_sg.id
}
