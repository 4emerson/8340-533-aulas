resource "aws_instance" "vm-web" {
  ami           = "ami-0e68dc81dc36750a1"
  instance_type = "t3.small"
  # depends_on = [ aws_s3_bucket.logs ]

  associate_public_ip_address = false
  tags = {
    Name = "vm-web"
  }
}

