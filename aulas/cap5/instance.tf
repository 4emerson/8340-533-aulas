resource "aws_instance" "minha-instancia" {
  ami           = "ami-0e68dc81dc36750a1"
  instance_type = "t3.nano"

  associate_public_ip_address = false
  tags = {
    Name = "minha-primeira-nome-diferente"
  }
}

