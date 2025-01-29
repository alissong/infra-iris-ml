output "ecs_cluster_id" {
  description = "ID do cluster ECS"
  value       = aws_ecs_cluster.main.id
}

output "ecs_task_definition_arn" {
  description = "ARN da Task Definition do ECS"
  value       = aws_ecs_task_definition.ml_task.arn
}
