resource "aws_security_group" "minha-sg-vars" {
  name   = var.sg_name

  ingress {
    from_port   = var.portas_vm[0]
    to_port     = var.portas_vm[0]
    protocol    = "tcp"
    cidr_blocks = var.ips_permitidos

  }

  ingress {
    from_port   = var.portas_vm[1]
    to_port     = var.portas_vm[1]
    protocol    = "tcp"
    cidr_blocks = var.ips_permitidos
  }

  ingress {
    from_port   = var.portas_vm[2]
    to_port     = var.portas_vm[2]
    protocol    = "tcp"
    cidr_blocks = var.ips_permitidos
  }

}