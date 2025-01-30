variable "ecs_cluster_name" {
  type        = string
  description = "Nome do Cluster ECS"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "subnets" {
  type        = list(string)
  description = "Lista de Subnets para o ECS"
}

variable "ecs_security_group_id" {
  type        = string
  description = "ID do Security Group do ECS"
}

variable "ecr_repository_url" {
  type        = string
  description = "URL do repositório ECR"
}

variable "ecs_cpu" {
  type        = string
  description = "Quantidade de CPU para a Task ECS"
  default     = "256"
}

variable "ecs_memory" {
  type        = string
  description = "Memória para a Task ECS"
  default     = "512"
}

variable "ecs_container_name" {
  type        = string
  description = "Nome do container ECS"
  default     = "ml-container"
}

variable "ecs_container_port" {
  type        = number
  description = "Porta do container ECS"
  default     = 8000
}

variable "ecs_desired_count" {
  type        = number
  description = "Número desejado de instâncias no ECS Service"
  default     = 1
}

variable "ecs_launch_type" {
  type        = string
  description = "Tipo de lançamento do ECS (EC2 ou FARGATE)"
  default     = "FARGATE"
}

variable "ecs_cluster_id" {
  type        = string
  description = "ID do cluster ECS"
}

variable "ecs_task_definition_arn" {
  type        = string
  description = "ARN da Task Definition do ECS"
}

variable "execution_role_name" {
  type        = string
  description = "ARN da Role de execução do ECS Task"
}

variable "ecs_task_family" {
  type        = string
  description = "Nome da família da Task ECS"
}

variable "ecs_service_name" {
  type        = string
  description = "Nome do serviço ECS"
}