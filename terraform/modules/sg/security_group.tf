resource "aws_security_group" "ecs_sg" {
  name        = var.security_group_name
  description = "Security group para o ECS"
  vpc_id      = var.vpc_id

  ingress {
    description = "Permitir tráfego do ALB para o ECS (porta 8000)"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    #security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    description = "Permitir tráfego HTTP (porta 80)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Permitir tráfego HTTPS (porta 443)"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Permitir saída para qualquer destino"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
