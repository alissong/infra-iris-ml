variable "vpc_id" {
  type        = string
  description = "ID da VPC onde os Security Groups serão criados"
}

variable "security_group_name" {
  type        = string
  description = "Nome do Security Group para o ECS"
}
