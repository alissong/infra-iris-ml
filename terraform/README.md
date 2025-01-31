# Infrastructure for Iris ML Application

This project configures the necessary infrastructure for the Iris ML application using Terraform and Terragrunt. The infrastructure includes:

- ECR repository to store Docker images
- ECS cluster to run containers
- ALB for load balancing and external access via HTTPS
- Security groups to control network traffic

## Module Structure

- **ecr**: Configures the ECR repository.
- **ecs**: Configures the ECS cluster, task definition, and service.
- **alb**: Configures the Application Load Balancer.
- **sg**: Configures the security groups.

## Variables

The main variables used in the project are:

```hcl
variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, staging, prod)"
  default     = "dev"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where resources will be created"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets for ALB and ECS"
}

variable "ecs_cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "alb_security_group_name" {
  type        = string
  description = "Name of the ALB Security Group"
}

variable "ecs_security_group_name" {
  type        = string
  description = "Name of the ECS Security Group"
}

variable "ecr_repository_url" {
  type        = string
  description = "URL of the ECR repository to store ECS images"
}

variable "ecs_desired_count" {
  type        = number
  description = "Desired number of instances in the ECS Service"
}

variable "ecs_execution_role_arn" {
  type        = string
  description = "ARN of the ECS Task execution role"
}

variable "ecs_container_port" {
  type        = number
  description = "Port used by the ECS container"
  default     = 8000
}

variable "ecs_launch_type" {
  type        = string
  description = "ECS launch type (EC2 or FARGATE)"
  default     = "FARGATE"
}

variable "ecs_task_family" {
  type        = string
  description = "Name of the Task Definition family"
}

variable "ecs_cpu" {
  type        = string
  description = "CPU for the ECS Task"
  default     = "256"
}

variable "ecs_memory" {
  type        = string
  description = "Memory for the ECS Task"
  default     = "512"
}

variable "ecs_container_name" {
  type        = string
  description = "Name of the ECS container"
}

variable "security_group_name" {
  type        = string
  description = "Name of the Security Group for ECS"
}

variable "execution_role_name" {
  type        = string
  description = "Name of the ECS Task execution role"
}

variable "ecs_service_name" {
  type        = string
  description = "Name of the ECS Service"
}

variable "ecr_repository_name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "alb_security_group_id" {
  type        = string
  description = "ID of the ALB Security Group."
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for HTTPS"
}
```

## Configuration

Before applying the configurations, fill in the `variables.tfvars` file with your environment data:

```hcl
# AWS region definition
region = "us-east-1"

# Environment (dev, staging, prod)
environment = "dev"

# Prefix for resource names
resource_name_prefix = "iris-ml-app"

# ID of the VPC where resources will be created
vpc_id = "YOUR_VPC_ID"

# Available subnets for ECS and ALB
subnets = [
  "YOUR_SUBNET_ID_1",
  "YOUR_SUBNET_ID_2",
  "YOUR_SUBNET_ID_3",
  "YOUR_SUBNET_ID_4",
  "YOUR_SUBNET_ID_5",
  "YOUR_SUBNET_ID_6"
]

# Name of the ECS cluster
ecs_cluster_name = "iris-ml-app-ecs-cluster"

# Name of the ALB Security Group
alb_security_group_name = "iris-ml-app-security-group"

# ID of the ALB Security Group
alb_security_group_id = "YOUR_ALB_SECURITY_GROUP_ID"

# Name of the ECS Security Group
ecs_security_group_name = "iris-ml-app-security-group"

# Name of the ECS Security Group
security_group_name = "iris-ml-app-security-group"

# URL of the ECR repository
ecr_repository_url = "YOUR_ECR_REPOSITORY_URL"

# ECS Service configuration
ecs_desired_count = 1
ecs_launch_type   = "FARGATE"

# ECS Task Definition configuration
ecs_task_family    = "iris-ml-app-task"
ecs_cpu            = "256"
ecs_memory         = "512"
ecs_container_name = "iris-ml-app-service"
ecs_container_port = 8000

# ARN of the ECS Task execution role
ecs_execution_role_arn = "YOUR_ECS_EXECUTION_ROLE_ARN"

# ARN of the ACM certificate for HTTPS
acm_certificate_arn = "YOUR_ACM_CERTIFICATE_ARN"
```

## Dependencies

The modules have the following dependencies:

- The `sg` module must be created before the `alb` and `ecs` modules.
- The `ecr` module must be created before the `ecs` module.
- The `alb` module must be created before the `ecs` module.

## CI/CD Process

This project uses GitHub Actions to automate the CI/CD process. The workflow is divided into three main stages:

1. **Terraform Plan**: Generates a Terraform execution plan.
2. **Manual Approval**: Creates a GitHub issue to request manual approval before applying the changes.
3. **Terraform Apply**: Applies the changes to the environment after approval.

### Workflow Details

- **Terraform Plan**: This workflow is triggered automatically when there is a push to the `main` branch or manually via GitHub Actions. It generates a Terraform execution plan.
- **Manual Approval**: After the plan is generated, a GitHub issue is created requesting approval to apply the changes. An authorized user must approve the issue to proceed.
- **Terraform Apply**: After approval, the workflow applies the changes to the environment using the `terragrunt apply` command.

### Commands

To manually apply the configurations, use the following commands:

```sh
terragrunt init
terragrunt plan
terragrunt apply
```

Ensure that all necessary variables are defined in the `variables.tfvars` file.

## Future Implementations

### Route 53 Configuration

In future implementations, we plan to configure AWS Route 53 to manage DNS for the Iris ML application. This will include:

- Setting up hosted zones
- Configuring DNS records for the application
- Integrating Route 53 with the ALB for seamless domain management

### CI/CD Improvements

We also plan to enhance the CI/CD process by adding a manual destroy step in the workflow. This will allow authorized users to manually trigger the destruction of the infrastructure when needed. The workflow will include:

- A manual approval step to confirm the destruction
- Execution of `terragrunt destroy` to remove the infrastructure

### Commands

To manually apply the configurations, use the following commands:

```sh
terragrunt init
terragrunt plan
terragrunt apply
```

To manually destroy the configurations, use the following command:

```sh
terragrunt destroy
```

Ensure that all necessary variables are defined in the `variables.tfvars` file.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
