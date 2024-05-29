output "ALB_DNS" {
  value = aws_lb.alb[*].dns_name
}