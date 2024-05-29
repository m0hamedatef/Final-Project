# Load Balancer Resources
resource "aws_lb" "alb" {
  count                = var.lb_config["count"][0]

  name                 = "${var.name}-${var.lb_config["name"][count.index]}-alb"
  load_balancer_type   = "application"
  internal             = var.lb_config["internal"][count.index]
  security_groups      = [ var.lb_sg[count.index] ]
  subnets              = var.lb_subnets[count.index] 

  enable_deletion_protection = false

  tags = {
    Environment = "ALB-${var.lb_config["name"][count.index]}"
  }
}

# Listener Resources
resource "aws_lb_listener" "listeners" {
  count               = 2
  load_balancer_arn   = aws_lb.alb[count.index].arn
  port                = 80
  protocol            = "HTTP"
  
  default_action {
    type              = "forward"
    target_group_arn  = aws_lb_target_group.tg[count.index].arn
  }
}

# Target Group Resources
resource "aws_lb_target_group" "tg" {
  count     = var.lb_config["count"][0]
  name      = "${var.name}-${var.lb_config["name"][count.index]}-tg"
  port      = 80
  protocol  = "HTTP"
  vpc_id    = var.vpc_id
}

# Private EC2s Attachment with the target group
resource "aws_lb_target_group_attachment" "private_attachment" {
  count = 2
  target_group_arn = aws_lb_target_group.tg[0].arn
  target_id        = var.tg_instances_id_private[count.index]
  port             = 80
}

# Public EC2s Attachment with the target group
resource "aws_lb_target_group_attachment" "public_attachment" {
  count = 2
  target_group_arn = aws_lb_target_group.tg[1].arn
  target_id        = var.tg_instances_id_public[count.index]
  port             = 80
}