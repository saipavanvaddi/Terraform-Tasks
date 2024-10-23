resource "aws_lb" "task_LB" {
  name               = "task-alb"
  internal           = false
  load_balancer_type = "application"
    
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-0926598d12770dc6c", "subnet-00832965f101045e6"]
}


resource "aws_lb_listener" "alb_lis" {
  load_balancer_arn = aws_lb.task_LB.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.task_tg.arn
  }
}
