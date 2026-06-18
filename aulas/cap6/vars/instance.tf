resource "aws_instance" "minha-instancia" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.minha-sg-vars.name]
  subnet_id = aws_subnet.ex-vars.id
  availability_zone = var.zone

  associate_public_ip_address = var.associate_public_ip_address
  tags = {
    Name = var.name
  }
}

