data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = [ "137112412989" ]

    filter {
      name = "name"
      values = [ "amzn2-ami-kernel-*-hvm-*-x86_64-gp2" ]
    }
  
}

resource "aws_launch_template" "this" {
    name_prefix = format("%s-lt-%s", var.nome, terraform.workspace)
    image_id = data.aws_ami.amazon_linux.id
    key_name = "curso-533-key"
    instance_type = var.instance_type

    network_interfaces {
      associate_public_ip_address = true
      security_groups = [ aws_security_group.instancias.id ]
      delete_on_termination = true
    }

    user_data = base64encode(<<-EOF
      #!/bin/bash
      sudo amazon-linux-extras install -y nginx1
      sudo systemctl start nginx
      sudo systemctl enable --now nginx
    EOF
    )

    tag_specifications {
      resource_type = "instance"
      tags = {
        Name        = format("%s-instancia-%s", var.nome, terraform.workspace)
        Environment = terraform.workspace
      }
    }

    tags = {
        Name        = format("%s-launch-template-%s", var.nome, terraform.workspace)
        Environment = terraform.workspace      
    }
}