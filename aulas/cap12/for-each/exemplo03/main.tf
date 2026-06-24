provider "aws" {
  region = "us-east-2"
}

variable "servicos" {
  type = map(number)
  default = {
    grafana    = 3000
    nginx      = 80
    prometheus = 9090
  }

}

resource "aws_security_group" "this" {

  for_each = var.servicos

  name = "sg${each.key}"

  ingress {
    from_port   = each.value
    to_port     = each.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = each.key

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-${each.key}"
  }

}

output "security_group_ids" {
    value = { for k, v in aws_security_group.this :  k => v.id  }
  
}