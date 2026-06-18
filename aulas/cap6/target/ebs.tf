resource "aws_ebs_volume" "meu-disco" {
  availability_zone = "us-east-2a"
  size              = 10
  tags = {
    Name = "disco-target"
  }
}


