resource "aws_lb" "test-alb" {
  name               = "nodejs-api"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]

  subnet_mapping {
    subnet_id = aws_subnet.public-subnet-1.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.public-subnet-2.id
  }

  enable_deletion_protection = false

  tags   = {
    Name = "Test Alb"
  }
}

resource "aws_lb_listener" "test_listener" {
  load_balancer_arn = aws_lb.test-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }
  depends_on = [aws_lb_target_group.test-tg]
}

resource "aws_lb_listener_rule" "test_rule" {
  listener_arn = aws_lb_listener.test_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
  depends_on = [aws_lb_target_group.test-tg, aws_lb_listener_rule.test_rule
  ]
}

resource "aws_lb_target_group" "test-tg" {
  name        = "nodejs-api-targetgroup"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    path                = "/"
    interval            = 30
    matcher             = "200,302"
  }
}