resource "aws_instance" "this" {
  count         = 4
  ami           = "ami-0e68dc81dc36750a1"
  instance_type = "t3.small"

  tags = {
    "Name" = "instancia-${count.index + 1}"
  }

}


