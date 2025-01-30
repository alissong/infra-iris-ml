# Definição da região AWS
region = "us-east-1"

# Ambiente (dev, staging, prod)
environment = "dev"

# Prefixo para os nomes dos recursos
resource_name_prefix = "iris-ml-app"

# ID da VPC onde os recursos serão criados
vpc_id = "vpc-06d92fe8a8a2338f0"

# Subnets disponíveis para o ECS e ALB
subnets = [
  "subnet-0522f692a71b93afa",
  "subnet-05f058473e31031e2",
  "subnet-0e6fcadc1e484717b",
  "subnet-01a3b68c5b08053e0",
  "subnet-099e91ac697f2c4f7",
  "subnet-06d4b5cee3e9e8977"
]

# Nome do cluster ECS
ecs_cluster_name = "iris-ml-app-ecs-cluster"

# Nome do Security Group para ALB
alb_security_group_name = "iris-ml-app-security-group"

# ID do Security Group para ALB
alb_security_group_id = "sg-0b3b3b3b3b3b3b3b3"

# Nome do Security Group para ECS
ecs_security_group_name = "iris-ml-app-security-group"

# Nome do Security Group para ECS
security_group_name = "iris-ml-app-security-group"

# URL do repositório ECR
ecr_repository_url = "123456789012.dkr.ecr.us-east-1.amazonaws.com/iris-ml-app-ecr"

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
ecs_execution_role_arn = "arn:aws:iam::123456789012:role/iris-ml-app-ecs-execution-role"

# ARN do certificado ACM para HTTPS
acm_certificate_arn = "arn:aws:acm:us-east-1:338846672827:certificate/5591839b-8804-4ca9-a133-4203d80aa6eb"
