#output "alb_security_group_id" {
#  value = aws_security_group.alb_sg.id
#}
#
#output "alb_dns" {
#  value       = module.alb.alb_dns
#  description = "DNS do Application Load Balancer"
#}
#
#output "ecs_cluster_arn" {
#  value       = module.ecs.ecs_cluster_arn
#  description = "ARN do cluster ECS"
#}
#
#output "ecs_security_group_id" {
#  value = aws_security_group.ecs_sg.id
#}