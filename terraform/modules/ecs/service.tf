#resource "aws_ecs_service" "ml_service" {
#  name            = "ml-service"
#  cluster         = aws_ecs_cluster.main.id
#  task_definition = aws_ecs_task_definition.ml_task.arn
#  desired_count   = var.ecs_desired_count
#  launch_type     = var.ecs_launch_type
#
#  network_configuration {
#    subnets         = var.subnets
#    security_groups = [var.ecs_security_group_id]
#    assign_public_ip = true
#  }
#
# security_groups = [
#  var.ecs_security_group_id
#]
# 
#
#  depends_on = [
#    aws_security_group.ecs_sg,  
#    aws_ecr_repository.ml_app   
#  ]
#}


resource "aws_ecs_service" "ml_service" {
  name            = "ml-service"
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
