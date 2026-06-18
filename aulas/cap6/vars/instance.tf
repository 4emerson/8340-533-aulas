resource "aws_instance" "minha-instancia" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.ex-vars.id
  availability_zone = var.zone

  associate_public_ip_address = var.associate_public_ip_address
  tags = {
    Name = var.name
  }
}

