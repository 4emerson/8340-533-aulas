resource "aws_autoscaling_group" "this" {
    name = format("%s-asg-%s", var.nome, terraform.workspace)
    min_size = var.asg_min
    max_size = var.asg_max
    desired_capacity = var.asg_desired

    vpc_zone_identifier = [ aws_subnet.public_a.id, aws_subnet.public_b.id ]

    launch_template {
      id = aws_launch_template.this.id
      version = "$Latest" 
    }

    health_check_type = "ELB"
    health_check_grace_period =  60

    tag {
      key = "Name"
      value = format("%s-asg-%s", var.nome, terraform.workspace)
      propagate_at_launch = true
    }

    tag {
      key = "Environment"
      value = terraform.workspace
      propagate_at_launch = true
    }
}