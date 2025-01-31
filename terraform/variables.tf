variable "region" {
  type        = string
  description = "Região AWS"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Nome do ambiente (dev, staging, prod)"
  default     = "dev"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC onde os recursos serão criados"
}

variable "subnets" {
  type        = list(string)
  description = "Lista de subnets para o ALB e ECS"
}

variable "ecs_cluster_name" {
  type        = string
  description = "Nome do cluster ECS"
}

variable "alb_security_group_name" {
  type        = string
  description = "Nome do Security Group do ALB"
}

variable "ecs_security_group_name" {
  type        = string
  description = "Nome do Security Group do ECS"
}

variable "ecr_repository_url" {
  type        = string
  description = "URL do repositório ECR para armazenar as imagens do ECS"
}

variable "ecs_desired_count" {
  type        = number
  description = "Número desejado de instâncias no ECS Service"
}

variable "ecs_execution_role_arn" {
  type        = string
  description = "ARN da Role de execução do ECS Task"
}

variable "ecs_container_port" {
  type        = number
  description = "Porta usada pelo container ECS"
  default     = 8000
}

variable "ecs_launch_type" {
  type        = string
  description = "Tipo de lançamento do ECS (EC2 ou FARGATE)"
  default     = "FARGATE"
}

variable "ecs_task_family" {
  type        = string
  description = "Nome da família da Task Definition"
}

variable "ecs_cpu" {
  type        = string
  description = "CPU para a ECS Task"
  default     = "256"
}

variable "ecs_memory" {
  type        = string
  description = "Memória para a ECS Task"
  default     = "512"
}

variable "ecs_container_name" {
  type        = string
  description = "Nome do container ECS"
}

variable "security_group_name" {
  type        = string
  description = "Nome do Security Group para o ECS"
}

variable "execution_role_name" {
  type        = string
  description = "Nome da Role de execução do ECS Task"
}

variable "ecs_service_name" {
  type        = string
  description = "Nome do ECS Service"
}

variable "ecr_repository_name" {
  type        = string
  description = "Nome do repositório ECR"
}

variable "alb_security_group_id" {
  type        = string
  description = "ID do Security Group do ALB."
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN do certificado ACM para HTTPS"
}
