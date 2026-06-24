resource "aws_instance" "this" {


  ami           = var.ami
  instance_type = var.instance_type
  count         = var.quantidade

  tags = {
    Name = "${var.nome}-${count.index}"
  }

}