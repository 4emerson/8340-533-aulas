resource "aws_security_group" "alb" {
  name   = format("%s-sg-alb-%s", var.nome, terraform.workspace)
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = var.porta_http
    to_port     = var.porta_http
    protocol    = "tcp"
    cidr_blocks = [var.cidr_qualquer_rede]
  }

  ingress {
    from_port   = var.porta_https
    to_port     = var.porta_https
    protocol    = "tcp"
    cidr_blocks = [var.cidr_qualquer_rede]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_qualquer_rede]
  }

  tags = {
    Name        = format("%s-sg-alb-%s", var.nome, terraform.workspace)
    Environment = terraform.workspace
  }

}


resource "aws_security_group" "instancias" {
  name   = format("%s-sg-ec2-%s", var.nome, terraform.workspace)
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = var.porta_ssh
    to_port     = var.porta_ssh
    protocol    = "tcp"
    cidr_blocks = [var.cidr_qualquer_rede]
  }

  ingress {
    from_port   = var.porta_http
    to_port     = var.porta_http
    protocol    = "tcp"
    cidr_blocks = [var.cidr_qualquer_rede]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_qualquer_rede]
  }

  tags = {
    Name        = format("%s-sg-ec2-%s", var.nome, terraform.workspace)
    Environment = terraform.workspace
  }

}