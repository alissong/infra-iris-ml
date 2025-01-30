output "alb_security_group_id" {
  description = "ID do Security Group do ALB"
  value       = aws_security_group.alb_sg.id
}

output "vpc_id" {
  description = "ID da VPC usada nos Security Groups"
  value       = var.vpc_id
}

output "ecs_security_group_id" {
  description = "ID do Security Group do ECS"
  value       = aws_security_group.ecs_sg.id
}
