resource "aws_ebs_volume" "meu-disco" {
  availability_zone = "us-east-2a"
  size              = 40
  tags = {
    Name = "meu-disco"
  }
}