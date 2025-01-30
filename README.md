# Infraestrutura para Aplicação Iris ML

Este projeto configura a infraestrutura necessária para a aplicação Iris ML utilizando Terraform e Terragrunt. A infraestrutura inclui:

- Repositório ECR para armazenar imagens Docker
- Cluster ECS para executar containers
- ALB para balanceamento de carga e acesso externo via HTTPS
- Grupos de segurança para controlar o tráfego de rede

## Estrutura dos Módulos

- **ecr**: Configura o repositório ECR.
- **ecs**: Configura o cluster ECS, task definition e serviço.
- **alb**: Configura o Application Load Balancer.
- **sg**: Configura os grupos de segurança.

## Variáveis

As variáveis principais utilizadas no projeto são:

```hcl
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
```

## Dependências

Os módulos possuem as seguintes dependências:

- O módulo `sg` deve ser criado antes dos módulos `alb` e `ecs`.
- O módulo `ecr` deve ser criado antes do módulo `ecs`.
- O módulo `alb` deve ser criado antes do módulo `ecs`.

## Comandos

Para aplicar as configurações, utilize os seguintes comandos:

```sh
terragrunt init
terragrunt plan
terragrunt apply
```

Certifique-se de que todas as variáveis necessárias estão definidas no arquivo `variables.tfvars`.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.
