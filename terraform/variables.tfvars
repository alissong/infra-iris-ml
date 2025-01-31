# Definição da região AWS
region = "us-east-1"

# Ambiente (dev, staging, prod)
environment = "dev"

# Prefixo para os nomes dos recursos
resource_name_prefix = "iris-ml-app"

# ID da VPC onde os recursos serão criados
vpc_id = "YOUR_VPC_ID"

# Subnets disponíveis para o ECS e ALB
subnets = [
  "YOUR_SUBNET_ID_1",
  "YOUR_SUBNET_ID_2",
  "YOUR_SUBNET_ID_3",
  "YOUR_SUBNET_ID_4",
  "YOUR_SUBNET_ID_5",
  "YOUR_SUBNET_ID_6"
]

# Nome do cluster ECS
ecs_cluster_name = "iris-ml-app-ecs-cluster"

# Nome do Security Group para ALB
alb_security_group_name = "iris-ml-app-security-group"

# ID do Security Group para ALB
alb_security_group_id = "YOUR_ALB_SECURITY_GROUP_ID"

# Nome do Security Group para ECS
ecs_security_group_name = "iris-ml-app-security-group"

# Nome do Security Group para ECS
security_group_name = "iris-ml-app-security-group"

# URL do repositório ECR
ecr_repository_url = "YOUR_ECR_REPOSITORY_URL"

# Configuração do ECS Service
ecs_desired_count = 1
ecs_launch_type   = "FARGATE"

# Configuração do ECS Task Definition
ecs_task_family    = "iris-ml-app-task"
ecs_cpu            = "256"
ecs_memory         = "512"
ecs_container_name = "iris-ml-app-service"
ecs_container_port = 8000

# ARN da role de execução do ECS Task
ecs_execution_role_arn = "YOUR_ECS_EXECUTION_ROLE_ARN"

# ARN do certificado ACM para HTTPS
acm_certificate_arn = "YOUR_ACM_CERTIFICATE_ARN"
