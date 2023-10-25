resource "aws_lb" "windows_lb" {
  name               = "my-alb"
  internal           = false  # Set to true if you want an internal ALB
  load_balancer_type = "application"

  enable_deletion_protection = false  # Enable or disable deletion protection

  subnets = var.subnet_ids  # Attach all available subnets
}

resource "aws_lb_target_group" "windows_tg" {
  name     = "windows-target-group"
  port     = 80
  protocol = "HTTP"

  target_type = "instance"

  vpc_id = var.vpc_id  # Attach it to the default VPC
}

locals {
  aws_hosts_map = { for host in var.aws_hosts : host => host }
}

resource "aws_lb_target_group_attachment" "website" {

  for_each = local.aws_hosts_map

  target_group_arn = aws_lb_target_group.windows_tg.arn
  target_id        = each.value
  port             = 80
}

resource "aws_lb_target_group_attachment" "website1" {

  for_each = local.aws_hosts_map

  target_group_arn = aws_lb_target_group.windows_tg.arn
  target_id        = each.value
  port             = 81
}

resource "aws_lb_target_group_attachment" "website2" {

  for_each = local.aws_hosts_map

  target_group_arn = aws_lb_target_group.windows_tg.arn
  target_id        = each.value
  port             = 82
}

locals {
  ports_map = { for idx, port in var.list_of_ports : tostring(idx) => port }
}


resource "aws_lb_listener" "HTTP" {

  for_each = local.ports_map

  load_balancer_arn = aws_lb.windows_lb.arn
  port              = each.value
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.windows_tg.arn
  }
}
