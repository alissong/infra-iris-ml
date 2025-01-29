provider "aws" {
  region = "us-east-1"
}


module "sg" {
  source = "./modules/sg"
  vpc_id = var.vpc_id
}

module "ecr" {
  source = "./ecr"
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

  depends_on = [
    module.sg, # Garante que o módulo sg seja criado antes do serviço ECS
    module.ecr # Garante que o módulo ecr seja criado antes do serviço ECS
  ]
}


#module "alb" {
#  source  = "./alb"
#  vpc_id  = var.vpc_id
#  subnets = var.subnets
#  alb_security_group_id = var.alb_security_group_id
#  #alb_security_group_id = module.security_group.alb_security_group_id 
#}
