resource "aws_security_group" "docker-host-sg" {
  name        = var.sg_name
  description = "Security group para a maquina virtual"

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

  egress {
    description = "Permitir todo o trafego de saida"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ips_permitidos
  }

  tags = {
    Name = var.sg_name
  }
}
