output "alb_dns" {
  value = module.alb.alb_dns_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "asg_name" {
  value = module.asg.asg_name
}
