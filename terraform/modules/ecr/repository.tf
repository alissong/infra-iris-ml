resource "aws_ecr_repository" "ml_app" {
  name = var.ecr_repository_name

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      name
    ]
  }
}
