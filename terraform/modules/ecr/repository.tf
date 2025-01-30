resource "aws_ecr_repository" "ml_app" {
  name = var.ecr_repository_name
}
