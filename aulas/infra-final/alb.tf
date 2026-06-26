resource "aws_lb" "this" {
    name = format("%s-alb-%s", var.nome, terraform.workspace)
    internal = false
    load_balancer_type = "application"
    security_groups = [ aws_security_group.alb.id ]
    subnets = [ aws_subnet.public_a.id, aws_subnet.public_b.id ]
    tags = {
        Name        = format("%s-alb-%s", var.nome, terraform.workspace)
        Environment = terraform.workspace      
    }
}

resource "aws_lb_target_group" "this" {
    name = format("%s-tg-%s", var.nome, terraform.workspace)
    port = var.porta_http
    protocol = "HTTP"
    vpc_id = aws_vpc.this.id

    health_check {
      path = "/"
      interval = 30
      timeout = 5
      healthy_threshold = 2
      unhealthy_threshold = 2
    }

    tags = {
        Name        = format("%s-tg-%s", var.nome, terraform.workspace)
        Environment = terraform.workspace            
    }
  
}

resource "aws_lb_listener" "this" {
    load_balancer_arn = aws_lb.this.arn
    port = var.porta_http
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.this.arn
    }
  
}

resource "aws_autoscaling_attachment" "this" {
    autoscaling_group_name = aws_autoscaling_group.this.name
    lb_target_group_arn = aws_lb_target_group.this.arn
  
}