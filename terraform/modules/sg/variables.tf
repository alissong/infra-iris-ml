variable "resource_name_prefix" {
  type        = string
  description = "Prefixo para os nomes dos recursos"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC onde os Security Groups serão criados"
}

variable "security_group_name" {
  type        = string
  description = "Nome do Security Group para o ECS"
}

variable "alb_security_group_id" {
  type        = string
  description = "ID do Security Group do ALB"
}

variable "alb_security_group_name" {
  type        = string
  description = "Nome do Security Group do ALB"
}