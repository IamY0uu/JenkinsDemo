output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "alb_arn" {
  description = "ARN of the ALB"
  value       = aws_lb.alb.arn
}

output "target_group_arn" {
  description = "Target group ARN to be attached to ASG"
  value       = aws_lb_target_group.tg.arn
}
