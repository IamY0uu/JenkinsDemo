output "rds_endpoint" {
  description = "RDS Endpoint (hostname)"
  value       = aws_db_instance.rds.endpoint
}

output "rds_identifier" {
  description = "RDS DB identifier"
  value       = aws_db_instance.rds.id
}
