resource "aws_lb_target_group" "task_tg" {
  name     = "task-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-08182b20eadd55ae6"
}

#Attaching intance EC2-1 to target group
resource "aws_lb_target_group_attachment" "web1_attachment" {
  target_group_arn = aws_lb_target_group.task_tg.arn
  target_id        = aws_instance.web1.id
  port             = 80
}

#Attaching intance EC2-2 to target group
resource "aws_lb_target_group_attachment" "web2_attachment" {
  target_group_arn = aws_lb_target_group.task_tg.arn
  target_id        = aws_instance.web2.id
  port             = 80
}
