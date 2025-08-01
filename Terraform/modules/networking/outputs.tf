output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]
}

output "app_subnet_ids" {
  value = [for subnet in aws_subnet.app : subnet.id]
}

output "db_subnet_ids" {
  value = [for subnet in aws_subnet.db : subnet.id]
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}

