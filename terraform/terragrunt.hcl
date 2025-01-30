locals {
  prefix                = "iris-ml-app"
  ecs_cluster_name      = "${local.prefix}-ecs-cluster"
  security_group_name   = "${local.prefix}-security-group"
  ecr_repository_name   = "${local.prefix}-ecr"
  execution_role_name   = "${local.prefix}-ecs-execution-role"
  ecs_task_family       = "${local.prefix}-task"
  ecs_service_name      = "${local.prefix}-service"
}

terraform {
  source = "./modules//${path_relative_to_include()}"

  extra_arguments "custom_vars" { 
    commands = ["apply", "console", "destroy", "import", "plan", "push", "refresh"] 
    arguments = [ 
      "-var-file=${get_terragrunt_dir()}/variables.tfvars"
    ] 
  } 
}

inputs = {
  ecs_cluster_name        = local.ecs_cluster_name
  alb_security_group_name = local.security_group_name
  ecs_security_group_name = local.security_group_name
  ecr_repository_url      = local.ecr_repository_name
  ecs_task_family         = local.ecs_task_family
  ecs_execution_role_arn  = local.execution_role_name
  ecs_container_name      = local.ecs_service_name
  execution_role_name     = local.execution_role_name
  ecs_service_name    = local.ecs_service_name
  ecr_repository_name = local.ecr_repository_name

  vpc_id               = "vpc-06d92fe8a8a2338f0"
  ecs_cluster_name     = "ml-cluster"
  subnets = [
    "subnet-0522f692a71b93afa",
    "subnet-05f058473e31031e2",
    "subnet-0e6fcadc1e484717b",
    "subnet-01a3b68c5b08053e0",
    "subnet-099e91ac697f2c4f7",
    "subnet-06d4b5cee3e9e8977"
  ]
}
