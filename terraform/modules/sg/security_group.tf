resource "aws_security_group" "ecs_sg" {
  name        = "ecs-security-group"
  description = "Security group para o ECS"
  vpc_id      = var.vpc_id

  ingress {
    description = "Permitir trafego do ALB para o ECS"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    #security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    description = "Permitir saida para qualquer destino"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
