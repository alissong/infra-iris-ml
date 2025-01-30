locals {
  prefix              = "iris-ml-app"
  ecs_cluster_name    = "${local.prefix}-ecs-cluster"
  security_group_name = "${local.prefix}-security-group"
  ecr_repository_name = "${local.prefix}-ecr"
  execution_role_name = "${local.prefix}-ecs-execution-role"
  ecs_task_family     = "${local.prefix}-task"
  ecs_service_name    = "${local.prefix}-service"
}
