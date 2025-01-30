# Terraform Infrastructure for Iris ML Application

This repository contains Terraform configurations for setting up the infrastructure required for the Iris ML application. The infrastructure includes an ECS cluster, ECR repository, and security groups.

## Modules

### ECR Module

This module creates an ECR repository for storing Docker images.

```hcl
module "ecr" {
  source = "./modules/ecr"

  ecr_repository_name = "iris-ml-app-ecr"
}
```

### ECS Module

This module creates an ECS task definition for running the ML application.

```hcl
module "ecs" {
  source = "./modules/ecs"

  ecs_task_family       = var.ecs_task_family
  ecr_repository_url    = var.ecr_repository_url
  execution_role_name   = var.execution_role_name
}
```

### Security Group Module

This module creates security groups for the ECS tasks.

```hcl
module "sg" {
  source = "./modules/sg"

  security_group_name = var.security_group_name
  vpc_id              = var.vpc_id
}
```

## Variables

### variables.tfvars

```hcl
# Definição da região AWS
region = "us-east-1"

# Ambiente (dev, staging, prod)
environment = "dev"

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

# Nome do Security Group para ECS
ecs_security_group_name = "iris-ml-app-security-group"

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
```

## Usage

1. Initialize Terraform:
   ```sh
   terraform init
   ```

2. Plan the infrastructure changes:
   ```sh
   terraform plan -var-file=./variables.tfvars
   ```

3. Apply the infrastructure changes:
   ```sh
   terraform apply -var-file=./variables.tfvars
   ```

## Import Existing Resources

If the resources already exist, you can import them into the Terraform state:

1. Import the ECR repository:
   ```sh
   terraform import module.ecr.aws_ecr_repository.ml_app <repository_arn>
   ```

2. Import the Security Group:
   ```sh
   terraform import module.sg.aws_security_group.ecs_sg <security_group_id>
   ```

Replace `<repository_arn>` and `<security_group_id>` with the appropriate values.

## License

This project is licensed under the MIT License.
