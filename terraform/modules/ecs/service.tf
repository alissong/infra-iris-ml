resource "aws_ecs_service" "ml_service" {
  name            = "${var.resource_name_prefix}-${var.ecs_service_name}"
  cluster         = var.ecs_cluster_id   # Passando o cluster como variável
  task_definition = var.ecs_task_definition_arn  # Task como variável
  desired_count   = var.ecs_desired_count
  launch_type     = var.ecs_launch_type

  network_configuration {
    subnets          = var.subnets
    security_groups  = [var.ecs_security_group_id]
    assign_public_ip = true
  }
}
