resource "aws_lb" "alb" {
  name               = "${var.environment}-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.web_sg.id
  ]
  subnets = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_1c.id
  ]
}

resource "aws_lb_target_group" "aws_target_group" {
  name     = "${var.environment}-app-target"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-app-target"
    Env  = var.environment
  }
}
/*
resource "aws_lb_target_group_attachment" "instance" {
    aws_target_group_arn = aws_lb_target_group.aws_target_group.arn
    target_id = aws_instance.app_server.id
}
*/