provider "aws" {
  region = "us-east-1"
}

locals {
  prefix              = "iris-ml-app"
  ecs_cluster_name    = "${local.prefix}-ecs-cluster"
  security_group_name = "${local.prefix}-security-group"
  ecr_repository_name = "${local.prefix}-ecr"
  execution_role_name = "${local.prefix}-ecs-execution-role"
  ecs_task_family     = "${local.prefix}-task"
  ecs_service_name    = "${local.prefix}-service"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = var.vpc_id
  security_group_name = var.ecs_security_group_name
  alb_security_group_id = var.alb_security_group_id
  alb_security_group_name = var.alb_security_group_name

}

module "ecr" {
  source = "./modules/ecr"
  ecr_repository_name = var.ecr_repository_name
}

module "alb" {
  source  = "./modules/alb"
  vpc_id  = var.vpc_id
  subnets = var.subnets
  alb_security_group_id = module.sg.alb_security_group_id

  depends_on = [
    module.sg # Garante que o módulo sg seja criado antes do ALB
  ]
}

module "ecs" {
  source                  = "./modules/ecs"
  ecs_cluster_name        = var.ecs_cluster_name
  vpc_id                  = module.sg.vpc_id
  subnets                 = var.subnets
  ecs_cluster_id          = module.ecs.ecs_cluster_id
  ecs_task_definition_arn = module.ecs.ecs_task_definition_arn
  ecs_security_group_id   = module.sg.ecs_security_group_id
  ecr_repository_url      = module.ecr.ecr_repository_url
  ecs_desired_count       = var.ecs_desired_count
  ecs_launch_type         = var.ecs_launch_type
  execution_role_name     = var.execution_role_name
  ecs_task_family         = var.ecs_task_family
  ecs_service_name        = var.ecs_service_name

  depends_on = [
    module.sg, # Garante que o módulo sg seja criado antes do serviço ECS
    module.ecr, # Garante que o módulo ecr seja criado antes do serviço ECS
    module.alb # Garante que o módulo alb seja criado antes do serviço ECS
  ]
}
