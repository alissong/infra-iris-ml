variable "vpc_id" {
  type        = string
  description = "ID da VPC onde os recursos serão criados"
}

variable "subnets" {
  type        = list(string)
  description = "Lista de subnets para o ALB e ECS"
}  

variable "alb_security_group_id" {
  type        = string
  description = "ID do Security Group do ALB"
}

variable "resource_name_prefix" {
  type        = string
  description = "Prefixo para os nomes dos recursos"
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN do certificado ACM para HTTPS"
}