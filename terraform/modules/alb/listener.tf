resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.ml_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  certificate_arn = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ml_tg.arn
  }
}
