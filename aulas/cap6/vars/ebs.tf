resource "aws_ebs_volume" "meu-disco" {
  availability_zone = var.zone
  size              = var.disk_ebs_size
  tags = {
    Name = var.disk_ebs_name
  }
}


